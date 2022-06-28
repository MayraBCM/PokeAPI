//
//  DetailProtocols.swift
//  pokeAPIVIPER
//
//  Created by Mayra Brenda Carreño Mondragon on 10/06/22.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func getDataPoke(poke: Pokemon_Struct)
    func cargarActivity()
    func stopAndHideActivity()
   
   
  
   
}

protocol DetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(poke: Pokemon_Struct) -> UIViewController
    func  presenterFavoriteView(from view: DetailViewProtocol)
    
}

protocol DetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var datoRecibido : Pokemon_Struct? {get set}
    var btnFav: Bool { get set }
    var pokeS : Pokemon_Struct! {get set}
    var nombreImage : String { get set }
    var nombreImage2 : String {get set}
    func saveData(pokemon : Pokemon_Struct)
    func goFavorite()
   
    func viewDidLoad()
}

protocol DetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
   
    
}

protocol DetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    
    func saveData(pokemon : Pokemon_Struct)
   
}

protocol DetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    
}

protocol DetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR

}

protocol DetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveData(pokemon : Pokemon_Struct)
    
}
