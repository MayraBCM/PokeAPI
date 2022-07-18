//
//  FavoriteDetailProtocols.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 28/06/22.
//  
//

import Foundation
import UIKit
import CoreData

protocol FavoriteDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FavoriteDetailPresenterProtocol? { get set }
    func getDataFav(fav: favorite)
}

protocol FavoriteDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createFavoriteDetailModule(fav: favorite) -> UIViewController
    func presenterFavoriteView(from view: FavoriteDetailViewProtocol)
}

protocol FavoriteDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FavoriteDetailViewProtocol? { get set }
    var interactor: FavoriteDetailInteractorInputProtocol? { get set }
    var wireFrame: FavoriteDetailWireFrameProtocol? { get set }
    func deleteFavoritos(id: Int)
    func viewDidLoad()
}

protocol FavoriteDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    
}

protocol FavoriteDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FavoriteDetailInteractorOutputProtocol? { get set }
    var localDatamanager: FavoriteDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FavoriteDetailRemoteDataManagerInputProtocol? { get set }
    var entity : FavoriteDetailEntity? {get set}
    var entityFav: favorite? {get set}
    func eliminate(id: Int)
}

protocol FavoriteDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol FavoriteDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FavoriteDetailRemoteDataManagerOutputProtocol? { get set }
}

protocol FavoriteDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FavoriteDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: FavoriteDetailLocalDataManagerOutputProtocol? {get set}
    func  deleteData(id: Int)
    
}

protocol FavoriteDetailLocalDataManagerOutputProtocol: AnyObject{
    // LOCALDATAMANAGER -> INTERACTOR
  
}
