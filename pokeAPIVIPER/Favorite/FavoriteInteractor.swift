//
//  FavoriteInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation

class FavoriteInteractor: FavoriteInteractorInputProtocol, FavoriteLocalDataManagerOutputProtocol {
    
    weak var presenter: FavoriteInteractorOutputProtocol?
    var localDatamanager: FavoriteLocalDataManagerInputProtocol?
    var remoteDatamanager: FavoriteRemoteDataManagerInputProtocol?
    
    func dataLocal() {
        localDatamanager?.getDataLocal()
    }
    
    func callBack(fav: [favorite]) {
        presenter?.presentData(fav: fav)
    }

}

extension FavoriteInteractor: FavoriteRemoteDataManagerOutputProtocol {
   
    
}
