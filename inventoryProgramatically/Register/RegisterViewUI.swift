//
//  RegisterViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

protocol RegisterViewUIDelegate {
    
}

class RegisterViewUI: UIView {
    var delegate: RegisterViewUIDelegate?
    var navigationController: UINavigationController?
    
    
    lazy private var registerLabel: inventory_NavigationBar = {
        let navigationBar = inventory_NavigationBar(titleText: "Registrate", delegate: nil, navigationController: self.navigationController, isMenuButtonHidden: true)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeSubtitleText(text: "Usuario")
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: InventoryColor.placeHolderText]
        let placeholderText = "Ingresa un nombre de usuario"
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        return textField
    }()
    
    let userPasswordLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeSubtitleText(text: "Contraseña")
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: InventoryColor.placeHolderText]
        let placeholderText = "Ingresa una contraseña"
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registrate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(continueTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .lightGray
        button.isEnabled = false
        return button
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: RegisterViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
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
        self.addSubview(userNameLabel)
        self.addSubview(userNameTextField)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(registerButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: topAnchor),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            registerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor, constant: 20),
            userNameLabel.trailingAnchor.constraint(equalTo: registerLabel.trailingAnchor, constant: -20),
            
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            userNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            userPasswordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
            userPasswordLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userPasswordLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            registerButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func continueTapped(_ sender: UIControl){
        print("continuar")
    }
    
    private func noNilFields() -> Bool {
        guard let username = userNameTextField.text, !username.isEmpty,
              let password = userPasswordTextField.text, !password.isEmpty else {
            registerButton.backgroundColor = .lightGray
            return false
        }
        registerButton.backgroundColor = InventoryColor.softColor
        return true
    }
}

extension RegisterViewUI: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        registerButton.isEnabled = noNilFields()
    }
}
