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
    }
}

extension FavoritePresenter: FavoriteInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
