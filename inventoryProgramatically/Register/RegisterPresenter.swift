//
//  RegisterPresenter.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation

class RegisterPresenter {
    var interactor: RegisterInteractorProtocol?
    weak var view: RegisterViewProtocol?
    var router: RegisterRouterProtocol?
}



extension RegisterPresenter: RegisterPresenterProtocol {
    
}
