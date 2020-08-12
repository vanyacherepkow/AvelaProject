//
//  UserCell.swift
//  AvelaDemo2
//
//  Created by Иван on 12.02.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        userImage.image = #imageLiteral(resourceName: "lion")
        
        currentPasswordField.constrainHeight(constant: 36)
        newPasswordField.constrainHeight(constant: 36)
        newPasswordRepeatField.constrainHeight(constant: 36)
        
        changePasswordButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        changePasswordButton.layer.cornerRadius = 10
        changePasswordButton.layer.borderWidth = 1
        changePasswordButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        changePasswordButton.tintColor = .white
        
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
        ], spacing: 16)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 16, bottom: 0, right: 16), size: .init(width: frame.width - 16 - 16, height: 250))
        addSubview(changePasswordButton)
        changePasswordButton.anchor(top: stackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 32, left: 75, bottom: 0, right: 75),size: .init(width: frame.width - 75 - 75, height: 50))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 50
        image.layer.masksToBounds = true
        image.backgroundColor = .red
        image.constrainWidth(constant: 60)
        image.constrainHeight(constant: 60)
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
    
    let changePasswordButton = UIButton(title: "Сменить пароль")
    
}
