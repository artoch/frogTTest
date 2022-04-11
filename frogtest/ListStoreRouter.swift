//
//  ListStoreRouter.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import UIKit

class ListStoreRouter: BaseRouter {
    //Se encarga de cargar la ruta de la vista
    var viewController: UIViewController{
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    //Retorna la view
    private func createViewController() ->  UIViewController{
        let view = StoreViewController(nibName: "StoreViewController", bundle: Bundle.main)
        return view
    }
    
    //carga el sourceview
    func setSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else {fatalError("falta error")}
        self.sourceView = view
    }
    
}
