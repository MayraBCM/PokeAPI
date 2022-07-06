//
//  DetailPresenter.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation

class DetailPresenter : DetailPresenterProtocol  {
    
    var datoRecibido: Pokemon_Struct?
    var btnFav: Bool = true
    var pokeS : Pokemon_Struct!
    var nombreImage = "anadir.png"
    var nombreImage2 = "Favorito1.png"
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    func viewDidLoad() {
        guard let poke = datoRecibido else {
            return
        }
        view?.getDataPoke(poke: poke)
        view?.cargarActivity()
    }
    
    func saveData(pokemon: Pokemon_Struct) {
        interactor?.saveData(pokemon: pokemon)
    }
    
    func goFavorite() {
        wireFrame?.presenterFavoriteView(from: view!)
    }
    
    
   
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    }
    
    
    
   

