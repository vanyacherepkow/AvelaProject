//
//  UserController.swift
//  
//
//  Created by Иван on 12.08.2020.
//

import UIKit
import SDWebImage
import JGProgressHUD

class UserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Api.shared.fetchUserInfo { (res) in
//            switch res{
//            case .failure(let err):
//                print("Failed to fetch info: ", err)
//            case .success(let user):
//                self.emailLabel.text = user.emailAddress
//                self.nameLabel.text = user.fullName
//                self.userImage.sd_setImage(with: URL(string: user.profileImageUrl))
//
//
//            }
//        }
        
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        userImage.image = #imageLiteral(resourceName: "lion")
        
        currentPasswordField.constrainHeight(36)
        currentPasswordField.isSecureTextEntry = true
        newPasswordField.constrainHeight(36)
        newPasswordField.isSecureTextEntry = true
        newPasswordRepeatField.constrainHeight(36)
        newPasswordRepeatField.isSecureTextEntry = true
        
        changePasswordButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        changePasswordButton.layer.cornerRadius = 10
        changePasswordButton.layer.borderWidth = 1
        changePasswordButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        changePasswordButton.constrainHeight(36)
        
        logoutButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        logoutButton.layer.cornerRadius = 10
        logoutButton.layer.borderWidth = 1
        logoutButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        logoutButton.constrainHeight(36)
        
        let photoStackView = HorizontalStackView(arrangedSubviews: [
            userImage,
            VerticalStackView(arrangedSubviews: [emailLabel, nameLabel])
        ], spacing: 16)
        
        //        photoStackView.sizeToFit()
        
        photoStackView.fillSuperview()
        
        let stackView = VerticalStackView(arrangedSubviews: [
            photoStackView,
            VerticalStackView(arrangedSubviews: [
                currentPasswordField,
                newPasswordField,
                newPasswordRepeatField
            ], spacing: 14),
            changePasswordButton,
            logoutButton
        ], spacing: 16)
        view.addSubview(stackView)
        stackView.anchor(top:
            view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        //            , size: .init(width: view.frame.width, height: view.frame.height))
        //        view.addSubview(changePasswordButton)
        //        changePasswordButton.anchor(top: stackView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 32, left: 75, bottom: 0, right: 75),size: .init(width: view.frame.width - 75 - 75, height: 50))
        
    }
    
    
    // MARK: - Views
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.backgroundColor = .red
        image.constrainWidth(100)
        image.constrainHeight(100)
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeProfilePic))
        image.addGestureRecognizer(tap)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let emailLabel = UILabel(text: "testtest@email.com", font: .systemFont(ofSize: 20))
    
    let nameLabel = UILabel(text: "Иван Иванов", font: .systemFont(ofSize: 20))
    
    let currentPasswordField: UITextField = {
        let field = UITextField()
        field.textFieldEdit(to: field)
        field.placeholder = "Введите старый пароль"
        return field
    }()
    
    let newPasswordField: UITextField = {
        let field = UITextField()
        field.textFieldEdit(to: field)
        field.placeholder = "Новый пароль"
        return field
    }()
    
    let newPasswordRepeatField: UITextField = {
        let field = UITextField()
        field.textFieldEdit(to: field)
        field.placeholder = "Повторите пароль"
        return field
    }()
    
    lazy var changePasswordButton = UIButton(title: "Сменить пароль", titleColor: .white)
    
    lazy var logoutButton = UIButton(title: "Выход", titleColor: .white, target: self, action: #selector(handleLogout))
    
    @objc fileprivate func changeProfilePic(){
        print("Button works")
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {return}
        
        dismiss(animated: true) {
            
            self.userImage.image = image
            
        }
    }
    
    @objc fileprivate func handleLogout(){
        
        let hud = JGProgressHUD(style: .dark)
        hud.textLabel.text = "Выход"
        hud.show(in: view)
        
        Api.shared.logout(){ (res) in
            hud.dismiss()
            
            switch res{
            case.failure:
                print("Ошибка при выполнении")
            case.success:
                let navigation = UINavigationController(rootViewController: LoginController())
                navigation.title = "Вход"
                self.view.window?.rootViewController = navigation
                self.view.window?.makeKeyAndVisible()
                
            }
        }
    }
}

