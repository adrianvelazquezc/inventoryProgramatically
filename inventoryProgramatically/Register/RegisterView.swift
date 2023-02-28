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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.ui?.registerButton.isUserInteractionEnabled = true
    }
}

extension RegisterView: RegisterViewProtocol {
    
}

extension RegisterView: RegisterViewUIDelegate {
    func notifyMailAndPassword(email: String, password: String) {
        self.ui?.mainView.backgroundColor = InventoryColor.transparentShadow2.withAlphaComponent(0.3)
        Auth.auth().createUser(withEmail: email, password: password) {
            (result, error) in
            if let _ = result, error == nil {
                self.ui?.animationView.play(completion: { finished in
                    self.navigationController?.popViewController(animated: true)
                })
            } else {
                self.ui?.mainView.backgroundColor = .clear
                self.ui?.registerButton.isUserInteractionEnabled = true
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
