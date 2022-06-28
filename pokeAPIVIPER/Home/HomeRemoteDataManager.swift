//
//  HomeRemoteDataManager.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var dataPoke = [Pokemon_Struct]()
    func externalGetData() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil {
                }
                
                if let datosSeguros = datos?.parseData(quitarString: "null,"){
                    if let listaPokemon = self.parsearJSON(datosPokemon: datosSeguros){
                        print("Lista pokemon: ", listaPokemon)
                        
                        self.remoteRequestHandler?.remoteDataManagerCallBackData(with: listaPokemon)

                    }
                }
            }
            
            tarea.resume()
        }
        
    }
    
    
        func parsearJSON(datosPokemon: Data) -> [Pokemon_Struct]? {
            let decodificador = JSONDecoder()
            do{
                let datosDecodificados = try decodificador.decode([Pokemon_Struct].self, from: datosPokemon)
                return datosDecodificados
                
            }catch {
                print("Error al decodificar los datos: ", error.localizedDescription)
                return nil
            }
        }
    }


    extension Data {
        func parseData(quitarString palabra: String) -> Data? {
            let dataAsString = String(data: self, encoding: .utf8)
            let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
            guard let data = parseDataString?.data(using: .utf8) else { return nil }
            return data
        }
    }
    
    
  


