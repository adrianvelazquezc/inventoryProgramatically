//
//  HomeViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit

protocol HomeViewUIDelegate {
    
}

class HomeViewUI: UIView{
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeTitleText(text: "Bienvenido")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Usuario"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Ingresa tu usuario"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        return textField
    }()
    
    let userPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Contraseña"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.placeholder = "Ingresa tu contraseña"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        return textField
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(continueTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 25
        button.backgroundColor = .lightGray
        button.isEnabled = false
        return button
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
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
        self.addSubview(welcomeLabel)
        self.addSubview(userNameLabel)
        self.addSubview(userNameTextField)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(continueButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            userNameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            userNameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            userNameTextField.heightAnchor.constraint(equalToConstant: 35),
            
            userPasswordLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),
            userPasswordLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userPasswordLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            continueButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
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
            continueButton.backgroundColor = .lightGray
            return false
        }
        continueButton.backgroundColor = .link
        return true
    }
}

extension HomeViewUI: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        continueButton.isEnabled = noNilFields()
    }
}
