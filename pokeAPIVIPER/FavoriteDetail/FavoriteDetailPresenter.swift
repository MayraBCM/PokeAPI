//
//  FavoriteDetailPresenter.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation

class FavoriteDetailPresenter  {
    
    // MARK: Properties
    weak var view: FavoriteDetailViewProtocol?
    var interactor: FavoriteDetailInteractorInputProtocol?
    var wireFrame: FavoriteDetailWireFrameProtocol?
    var datoReFav: favorite?
    var favS: favorite!
    
}

extension FavoriteDetailPresenter: FavoriteDetailPresenterProtocol {
    func deleteFavoritos(id: Int) {
        interactor?.eliminate(id: id)
    }
    
   
    
    func viewDidLoad() {
        guard let fav = datoReFav else {
            return
        }
        view?.getDataFav(fav: fav)
        
    }
}

extension FavoriteDetailPresenter: FavoriteDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
