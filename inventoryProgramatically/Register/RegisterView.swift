//
//  RegisterView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

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
    
}

extension RegisterView: RegisterViewUIDelegate {
    func notifyError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        //        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: { action in
        //        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
