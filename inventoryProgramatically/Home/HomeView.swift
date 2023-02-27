//
//  HomeView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit
import FirebaseAuth

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    
    override func loadView() {
        ui = HomeViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        self.navigationController?.isNavigationBarHidden = true
        view = ui
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
}

extension HomeView: HomeViewProtocol {
    func showLoading() {
        inventory_ActivityIndicator.show(parent: self.view)
    }
    
    func dissmissLoading() {
        inventory_ActivityIndicator.remove(parent: self.view)
    }
}

extension HomeView: HomeViewUIDelegate {
    func notifyMailAndPassword(email: String, password: String) {
        DispatchQueue.main.async {
            self.showLoading()
        }
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            DispatchQueue.main.async {
                self.dissmissLoading()
                if let _ = result, error == nil {
                    self.presenter?.requestNextView()
                } else {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    func notifyLoader(isLoading: Bool) {
        if isLoading{
            self.showLoading()
        } else {
            self.dissmissLoading()
        }
    }
    
    func notifyRegisterUser() {
        self.presenter?.requestRegisterUser()
    }
    
    
}
