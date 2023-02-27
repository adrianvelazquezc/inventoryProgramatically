//
//  InventoryListMain.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

open class InventoryListMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: InventoryListView? = InventoryListView()
        if let view = viewController {
            let presenter = InventoryListPresenter()
            let router = InventoryListRouter()
            let interactor = InventoryListInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
