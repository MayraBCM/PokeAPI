//
//  FavoriteWireFrame.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation
import UIKit

class FavoriteWireFrame: FavoriteWireFrameProtocol {
    
    
  
    class func createFavoriteModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "FavoriteView")
        if let view = navController as? FavoriteView {
            let presenter: FavoritePresenterProtocol & FavoriteInteractorOutputProtocol = FavoritePresenter()
            let interactor: FavoriteInteractorInputProtocol & FavoriteRemoteDataManagerOutputProtocol & FavoriteLocalDataManagerOutputProtocol = FavoriteInteractor()
            let localDataManager: FavoriteLocalDataManagerInputProtocol = FavoriteLocalDataManager()
            let remoteDataManager: FavoriteRemoteDataManagerInputProtocol = FavoriteRemoteDataManager()
            let wireFrame: FavoriteWireFrameProtocol = FavoriteWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            localDataManager.interactor = interactor
            interactor.remoteDatamanager = remoteDataManager
            
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Favorite", bundle: Bundle.main)
    }
    
    
    func showDetailPokemonView(from view: FavoriteViewProtocol, fav: favorite) {
        let newDetailFavorite = FavoriteDetailWireFrame.createFavoriteDetailModule(fav: fav)
        if let newView = view as? UIViewController{
            newView.present(newDetailFavorite, animated: true)
    }
    }
   
}

