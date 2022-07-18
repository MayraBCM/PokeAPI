//
//  DetailInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
     var entityPokemon: Pokemon_Struct?
    var entity: DetailEntity?
    

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?
    
   
    func saveData(pokemon: Pokemon_Struct) {
        localDatamanager?.saveData(pokemon: pokemon)
    }
    
    func saveData() {
        if let pokemon = entity?.pokeS {
            localDatamanager?.saveData(pokemon: pokemon)
        }
        entity?.btnFav = !(entity?.btnFav ?? false)
        presenter?.changeFav(image: entity?.favImage)
    }
}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
