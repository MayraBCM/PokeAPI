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
   
    
    func viewDidLoad() {
        interactor?.dataLocal()
    }
    
    func showDataDetail(fav: favorite) {
        wireFrame?.showDetailPokemonView(from: view!, fav: fav)
    }
    
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    func presentData(fav: [favorite]) {
        view?.showData(fav: fav)
    }
    
}
