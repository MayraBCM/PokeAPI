//
//  DetailWireFrame.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
   
    static func createDetailModule(poke: Pokemon_Struct) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
        if let view = viewController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.datoRecibido = poke
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
   
    func presenterFavoriteView(from view: DetailViewProtocol) {
        let newDetailFavorite = FavoriteWireFrame.createFavoriteModule()
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(newDetailFavorite, animated: true)
    }
    
}
}

