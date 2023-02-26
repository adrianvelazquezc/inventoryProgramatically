//
//  HomeProtocols.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    
}

protocol HomeInteractorProtocol: AnyObject {
    
}

protocol HomePresenterProtocol: AnyObject {
    func requestRegisterUser()
}

protocol HomeRouterProtocol: AnyObject {
    func navigateToRegisterUser()
}
