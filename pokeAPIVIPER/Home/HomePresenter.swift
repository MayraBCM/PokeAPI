//
//  HomePresenter.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class HomePresenter  {
    
    
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    
    func showDataDetail(poke: Pokemon_Struct) {
        wireFrame?.showDetailPokemonView(from: view!, poke: poke)
    }
    
  
    
    
    
   
    func viewDidLoad() {
        interactor?.interactorGetData()
    }
    
}


extension HomePresenter: HomeInteractorOutputProtocol {
    func interactorPushDataPresenter(with data: [Pokemon_Struct]) {
        view?.presenterPushDataView(with: data)
       
        
    }
    
  
    
    
}
