//
//  RegisterViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import UIKit

 protocol inventory_NavigationBarDelegate {
    func buttonTapped()
}

open class inventory_NavigationBar: UIView {
    
    var navigationbar: UINavigationController?
    var delegate: inventory_NavigationBarDelegate?
    
    lazy private var navigationTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 14, height: 7))
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "leftArrowIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.arrowTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var menuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 14, height: 7))
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "menuIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.menuTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        
        setUI()
        setConstraints()
    }
    
    init(titleText: String, textColor: UIColor = .white, delegate: inventory_NavigationBarDelegate? = nil,
         navigationController: UINavigationController?, isarrowButtonHidden: Bool = false, isMenuButtonHidden: Bool = false) {
        super.init(frame: .zero)
        
        self.navigationbar = navigationController
        self.delegate = delegate
        self.leftButton.isHidden = isarrowButtonHidden
        self.menuButton.isHidden = isMenuButtonHidden
        navigationTitle.attributedText = getDecorativeSubtitleText(text: titleText)
        navigationTitle.textColor = textColor
        
        leftButton.tintColor = textColor
        menuButton.tintColor = textColor
        
        setUI()
        setConstraints()
    }

    @objc private func buttonTapped(_ sender: UIButton){
        delegate?.buttonTapped()
    }

    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        self.backgroundColor = InventoryColor.darkColor
        self.addSubview(navigationTitle)
        self.addSubview(menuButton)
        self.addSubview(leftButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 80),
            
            navigationTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            navigationTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            leftButton.centerYAnchor.constraint(equalTo: navigationTitle.centerYAnchor),
            leftButton.widthAnchor.constraint(equalToConstant: 15),
            leftButton.heightAnchor.constraint(equalToConstant: 15),
            leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            menuButton.centerYAnchor.constraint(equalTo: navigationTitle.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 15),
            menuButton.heightAnchor.constraint(equalToConstant: 15),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    @objc private func menuTapped(_ sender: UIButton){
        delegate?.buttonTapped()
    }
    
    @objc private func arrowTapped(_ sender: UIButton){
        if let navController = self.navigationbar {
            navController.popViewController(animated: true)
        }else {
            
        }
    }
}
