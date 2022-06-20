//
//  FavoriteProtocols.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 16/06/22.
//  
//

import Foundation
import UIKit

protocol FavoriteViewProtocol:  AnyObject{
    // PRESENTER -> VIEW
    var presenter: FavoritePresenterProtocol? { get set }
}

protocol FavoriteWireFrameProtocol: AnyObject{
    // PRESENTER -> WIREFRAME
    static func createFavoriteModule() -> UIViewController
}

protocol FavoritePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FavoriteViewProtocol? { get set }
    var interactor: FavoriteInteractorInputProtocol? { get set }
    var wireFrame: FavoriteWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol FavoriteInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol FavoriteInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FavoriteInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FavoriteRemoteDataManagerInputProtocol? { get set }
}

protocol FavoriteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol FavoriteRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FavoriteRemoteDataManagerOutputProtocol? { get set }
}

protocol FavoriteRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FavoriteLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
