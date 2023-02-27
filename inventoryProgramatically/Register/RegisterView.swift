//
//  RegisterView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit
import FirebaseAuth

class RegisterView: UIViewController {
    var presenter: RegisterPresenterProtocol?
    private var ui: RegisterViewUI?
    
    override func loadView() {
        ui = RegisterViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
        self.navigationController?.isNavigationBarHidden = true
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

extension RegisterView: RegisterViewProtocol {
    func showLoading() {
        inventory_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        inventory_ActivityIndicator.remove(parent: self.view)
    }
    
}

extension RegisterView: RegisterViewUIDelegate {
    func notifyMailAndPassword(email: String, password: String) {
        DispatchQueue.main.async {
            self.showLoading()
        }
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            DispatchQueue.main.async {
                self.dissmissLoading()
                if let _ = result, error == nil {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
