//
//  InventoryListView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit
import FirebaseAuth

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
    func showLoading() {
        inventory_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        inventory_ActivityIndicator.remove(parent: self.view)
    }
    
}

extension InventoryListView: InventoryListViewUIDelegate {
    func notifyButtonTaped() {
        let alertController = UIAlertController(title: "¿Que quieres hacer?", message: nil, preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Ver Perfil", style: .default) { _ in

        }
        alertController.addAction(action1)
        let action2 = UIAlertAction(title: "Desconectar", style: .destructive) { _ in
            do{
                try Auth.auth().signOut()
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Error while signing out!")
            }
        }
        alertController.addAction(action2)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}
