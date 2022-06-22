//
//  DetailInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    
   
    
    
   
    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    
   
    func saveData(pokemon: Pokemon_Struct) {
        localDatamanager?.saveData(pokemon: pokemon)
    }
    

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
