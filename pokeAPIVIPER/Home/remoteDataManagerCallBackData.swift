//
//  HomeInteractor.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {
    var entity: pokemonEntity?
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    func interactorGetData() {
        remoteDatamanager?.externalGetData()
        
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    func remoteDataManagerCallBackData(with data: [Pokemon_Struct]) {
        presenter?.interactorPushDataPresenter(with: data)
        
    }
    
}
