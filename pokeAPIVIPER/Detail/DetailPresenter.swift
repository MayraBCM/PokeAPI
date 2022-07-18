//
//  DetailPresenter.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

class DetailPresenter : DetailPresenterProtocol  {
   
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    
    func viewDidLoad() {
        guard let poke = interactor?.entityPokemon else {return}
        view?.getDataPoke(poke: poke)
    }
   
    func saveData() {
       interactor?.saveData()
   }
    
    func goFavorite() {
        wireFrame?.presenterFavoriteView(from: view!)
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func changeFav(image: UIImage?) {
        view?.setImageBtn(image: interactor?.entity?.favImage )
    
       
    }
    
    
}
   

