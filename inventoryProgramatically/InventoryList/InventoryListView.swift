//
//  InventoryListView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

class InventoryListView: UIViewController {
    var presenter: InventoryListPresenterProtocol?
    private var ui: InventoryListViewUI?
    
    override func loadView() {
        ui = InventoryListViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
}

extension InventoryListView: InventoryListViewProtocol {
    
}

extension InventoryListView: InventoryListViewUIDelegate {
    func notifyButtonTaped() {
        let alertController = UIAlertController(title: "¿Que quieres hacer?", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Ver Perfil", style: .default) { _ in
//            self.successFavoriteAdded()
        }
        alertController.addAction(action1)
        let action2 = UIAlertAction(title: "Desconectar", style: .destructive) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(action2)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
