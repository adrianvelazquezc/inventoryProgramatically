//
//  HomeMain.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

open class HomeMain{
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: HomeView? = HomeView()
        if let view = viewController {
            let presenter = HomePresenter()
            let router = HomeRouter()
            let interactor = HomeInteractor()
            
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
