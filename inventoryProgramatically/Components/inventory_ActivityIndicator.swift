//
//  UILoader.swift
//  AceptaPagoBaz
//
//  Created by David on 29/04/20.
//  Copyright © 2020 Zeus. All rights reserved.
//

import UIKit

open class inventory_ActivityIndicator {
    
    private static let tagView = -1
    
    private static var inventoryIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = InventoryColor.activityColor
        indicator.clipsToBounds = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    
    public static func show(parent: UIView) {
        parent.endEditing(true)
        if parent.viewWithTag(tagView) != nil {
            return
        }
        parent.isUserInteractionEnabled = false
        let mainView = UIView(frame: (parent.frame))
        mainView.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1221039245)
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.tag = tagView
        
        mainView.addSubview(inventoryIndicator)
        parent.addSubview(mainView)
        inventoryIndicator.startAnimating()
        
            NSLayoutConstraint.activate([
                inventoryIndicator.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                inventoryIndicator.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            ])
    }
    
    public static func remove(parent: UIView) {
        parent.endEditing(true)
        parent.isUserInteractionEnabled = true
        if let loaderView = parent.viewWithTag(tagView) {
            loaderView.removeFromSuperview()
        }
        inventoryIndicator.stopAnimating()
    }
}
