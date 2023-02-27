//
//  HomeView.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

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
    
}

extension HomeView: HomeViewUIDelegate {
    func notifyNextView() {
        self.presenter?.requestNextView()
    }
    
    func notifyError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func notifyRegisterUser() {
        self.presenter?.requestRegisterUser()
    }
    
    
}
