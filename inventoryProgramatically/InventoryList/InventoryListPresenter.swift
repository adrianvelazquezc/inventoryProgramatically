//
//  InventoryListPresenter.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation

class InventoryListPresenter {
    var interactor: InventoryListInteractorProtocol?
    weak var view: InventoryListViewProtocol?
    var router: InventoryListRouterProtocol?
}



extension InventoryListPresenter: InventoryListPresenterProtocol {
    
}
