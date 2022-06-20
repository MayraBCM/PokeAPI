//
//  FavoriteInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation

class FavoriteInteractor: FavoriteInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: FavoriteInteractorOutputProtocol?
    var localDatamanager: FavoriteLocalDataManagerInputProtocol?
    var remoteDatamanager: FavoriteRemoteDataManagerInputProtocol?

}

extension FavoriteInteractor: FavoriteRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
