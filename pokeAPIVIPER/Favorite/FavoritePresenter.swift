//
//  FavoritePresenter.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation

class FavoritePresenter  {
    
    // MARK: Properties
    weak var view: FavoriteViewProtocol?
    var interactor: FavoriteInteractorInputProtocol?
    var wireFrame: FavoriteWireFrameProtocol?
    
}

extension FavoritePresenter: FavoritePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.dataLocal()
    }
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    func presentData(fav: [favorite]) {
        view?.showData(fav: fav)
    }
    
}
