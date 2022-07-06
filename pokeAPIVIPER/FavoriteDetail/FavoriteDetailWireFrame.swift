//
//  FavoriteDetailWireFrame.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation
import UIKit

class FavoriteDetailWireFrame: FavoriteDetailWireFrameProtocol {

    class func createFavoriteDetailModule(fav: favorite) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "FavoriteDetailView")
        if let view = navController as? FavoriteDetailView {
            let presenter: FavoriteDetailPresenterProtocol & FavoriteDetailInteractorOutputProtocol = FavoriteDetailPresenter()
            let interactor: FavoriteDetailInteractorInputProtocol & FavoriteDetailRemoteDataManagerOutputProtocol = FavoriteDetailInteractor()
            let localDataManager: FavoriteDetailLocalDataManagerInputProtocol = FavoriteDetailLocalDataManager()
            let remoteDataManager: FavoriteDetailRemoteDataManagerInputProtocol = FavoriteDetailRemoteDataManager()
            let wireFrame: FavoriteDetailWireFrameProtocol = FavoriteDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            presenter.datoReFav = fav
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "FavoriteDetail", bundle: Bundle.main)
    }
    
}
