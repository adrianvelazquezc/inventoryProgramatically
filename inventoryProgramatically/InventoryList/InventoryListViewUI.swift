//
//  InventoryListViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

protocol InventoryListViewUIDelegate {
    func notifyButtonTaped()
}

class InventoryListViewUI: UIView{
    var delegate: InventoryListViewUIDelegate?
    var navigationController: UINavigationController?
    
    lazy private var registerLabel: inventory_NavigationBar = {
        let navigationBar = inventory_NavigationBar(titleText: "Inventario", delegate: self, navigationController: self.navigationController, isMenuButtonHidden: false)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: InventoryListViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.addSubview(registerLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: topAnchor),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            registerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

extension InventoryListViewUI: inventory_NavigationBarDelegate {
    func buttonTapped() {
        self.delegate?.notifyButtonTaped()
    }
}
