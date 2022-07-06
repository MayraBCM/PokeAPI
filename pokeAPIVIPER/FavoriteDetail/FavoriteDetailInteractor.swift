//
//  FavoriteDetailInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation

class FavoriteDetailInteractor: FavoriteDetailInteractorInputProtocol {
    func eliminate(id: Int) {
        localDatamanager?.deleteData(id: id)
    }
    
    
    

    // MARK: Properties
    weak var presenter: FavoriteDetailInteractorOutputProtocol?
    var localDatamanager: FavoriteDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: FavoriteDetailRemoteDataManagerInputProtocol?
    
    

}

extension FavoriteDetailInteractor: FavoriteDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
