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
    var arrFavoritos: [favorite]!
}

extension FavoritePresenter: FavoritePresenterProtocol {
 
    func showDataDetail(fav: favorite) {
        wireFrame?.showDetailPokemonView(from: view!, fav: fav)
    }
    
    func viewDidLoad() {
        interactor?.dataLocal()
    }
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    func presentData(fav: [favorite]) {
        view?.showData(fav: fav)
    }
    
}
