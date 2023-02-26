//
//  HomePresenter.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation

class HomePresenter {
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
}



extension HomePresenter: HomePresenterProtocol {
    
}
