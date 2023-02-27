//
//  HomeRouter.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

class HomeRouter{
    var navigation: UINavigationController?
}

extension HomeRouter: HomeRouterProtocol{
    func navigateToNextView() {
            if let navigationController = self.navigation{
                DispatchQueue.main.async {
                    let vc = InventoryListMain.createModule(navigation: navigationController)
                    navigationController.pushViewController(vc, animated: true )
                }
            }
    }
    
    func navigateToRegisterUser() {
        if let navigationController = self.navigation{
            DispatchQueue.main.async {
                let vc = RegisterMain.createModule(navigation: navigationController)
                navigationController.pushViewController(vc, animated: true )
            }
        }
    }
    
    
}
