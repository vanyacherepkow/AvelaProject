//
//  LoginController.swift
//  AvelaDemo2
//
//  Created by Иван on 19.03.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit
import JGProgressHUD
import Alamofire
import LBTATools

class LoginController: UIViewController{
    
    var items = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupStack()
        
        errorLabel.isHidden = true
        passwordField.isSecureTextEntry = true
        
        navigationItem.title = "Вход"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        print("something")
        
    }
    
    lazy var enterButton: UIButton = {
        let enterButton = UIButton()
        enterButton.setTitle("Войти", for: .normal)
        enterButton.tintColor = .white
        enterButton.titleLabel?.font = .systemFont(ofSize: 20)
        enterButton.layer.borderWidth = 1
        enterButton.layer.cornerRadius = 10
        enterButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        enterButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        enterButton.layer.cornerRadius = 10
        enterButton.layer.masksToBounds = true
        enterButton.addTarget(self, action: #selector(handelLogin), for: .touchUpInside)
        
        return enterButton
    }()
    
    func setupStack(){
        imageView.image = #imageLiteral(resourceName: "phoenix_logo_b_color")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        //        imageView.constrainHeight(80)
        
        emailField.constrainHeight(36)
        passwordField.constrainHeight(36)
        //        errorLabel.constrainHeight(36)
        
        titleLabel.textAlignment = .center
        
        
        //        let logoView = VerticalStackView(arrangedSubviews: [
        //            imageView
        //        ])
        //        logoView.fillSuperview(padding: .init(top: 15, left: 10, bottom: 15, right: 10))
        //        imageView.fillSuperview(padding: .init(top: 15, left: 10, bottom: 15, right: 10))
        
        let fieldsStackView = VerticalStackView(arrangedSubviews: [
            titleLabel,
            emailField,
            passwordField,
            errorLabel,
            enterButton
        ], spacing: 10)
        
        errorLabel.heightAnchor.constraint(equalTo: fieldsStackView.heightAnchor, multiplier: 2/10).isActive = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            imageView,
            fieldsStackView
        ], spacing: 20)
        view.addSubview(stackView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.3).isActive = true
        fieldsStackView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.7).isActive = true
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,
                         padding: .init(top: 10, left: 16, bottom: 0, right: 16)
        )
        stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    let imageView = UIImageView(cornerRadius: 6)
    
    let titleLabel = UILabel(text: "Войти в личный кабинет", font: .systemFont(ofSize: 20))
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let emailField: UITextField = {
        let field = UITextField()
        field.textFieldEdit(to: field)
        field.placeholder = "Почта"
        return field
    }()
    
    let passwordField: UITextField = {
        let field = UITextField()
        field.textFieldEdit(to: field)
        field.placeholder = "Пароль"
        return field
    }()
    
    @objc fileprivate func handelLogin(){
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Авторизация"
        hud.show(in: view)
        
        guard let email = emailField.text else {return}
        guard let password = passwordField.text else {return}
        
        errorLabel.isHidden = true
        
        Api.shared.login(email: email, password: password) { (res) in
            hud.dismiss()
            switch res{
            case.failure:
                self.errorLabel.isHidden = false
                self.errorLabel.text = "Введенные почта или пароль неверные.\n Повторите снова"
            case.success:
                self.view.window?.rootViewController = BaseTabBarController()
                self.view.window?.makeKeyAndVisible()
            }
            
        }
    }
}
