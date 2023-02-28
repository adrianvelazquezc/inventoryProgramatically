//
//  RegisterViewUI.swift
//  inventoryProgramatically
//
//  Created by Mac on 26/02/23.
//

import Foundation
import UIKit
import Lottie

protocol RegisterViewUIDelegate {
    func notifyMailAndPassword(email: String, password: String)
}

class RegisterViewUI: UIView {
    var delegate: RegisterViewUIDelegate?
    var navigationController: UINavigationController?
    
    
    public var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var registerLabel: inventory_NavigationBar = {
        let navigationBar = inventory_NavigationBar(titleText: "Registrate", delegate: nil, navigationController: self.navigationController, isMenuButtonHidden: true)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        return navigationBar
    }()
    
    let userMailLabel: UILabel = {
        let label = UILabel()
        label.attributedText = getDecorativeSubtitleText(text: "Correo")
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userMailTextField: UITextField = {
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
        let placeholderText = "Ingresa un correo"
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
    
    public lazy var animationView: AnimationView = {
       let animation = AnimationView(name: "72462-check-register")
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.loopMode = .playOnce
        animation.isUserInteractionEnabled = false
        return animation
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
        self.addSubview(userMailLabel)
        self.addSubview(userMailTextField)
        self.addSubview(userPasswordLabel)
        self.addSubview(userPasswordTextField)
        self.addSubview(registerButton)
        self.addSubview(mainView)
        self.addSubview(animationView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            registerLabel.topAnchor.constraint(equalTo: topAnchor),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            registerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userMailLabel.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 50),
            userMailLabel.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor, constant: 20),
            userMailLabel.trailingAnchor.constraint(equalTo: registerLabel.trailingAnchor, constant: -20),
            
            userMailTextField.topAnchor.constraint(equalTo: userMailLabel.bottomAnchor, constant: 20),
            userMailTextField.leadingAnchor.constraint(equalTo: userMailLabel.leadingAnchor),
            userMailTextField.trailingAnchor.constraint(equalTo: userMailLabel.trailingAnchor),
            userMailTextField.heightAnchor.constraint(equalToConstant: 35),
            
            userPasswordLabel.topAnchor.constraint(equalTo: userMailTextField.bottomAnchor, constant: 50),
            userPasswordLabel.leadingAnchor.constraint(equalTo: userMailLabel.leadingAnchor),
            userPasswordLabel.trailingAnchor.constraint(equalTo: userMailLabel.trailingAnchor),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userMailLabel.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userMailLabel.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            
            registerButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: userMailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: userMailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func continueTapped(_ sender: UIControl){
        self.registerButton.isUserInteractionEnabled = false
        if let email = userMailTextField.text, let password = userPasswordTextField.text {
            self.delegate?.notifyMailAndPassword(email: email, password: password)
        }
    }
    
    private func noNilFields() -> Bool {
        guard let userMail = userMailTextField.text, !userMail.isEmpty,
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
