//
//  NewsBlockCell.swift
//  AvelaDemo2
//
//  Created by Иван on 31.01.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class NewsBlockCell: UICollectionViewCell {
    
//    var tags: Tags?{
//        didSet{
//            if let name = tags?.name{
//                titleLabel.text = name
//            }
//            
//            if let tagGroupImage = tags?.tag_group_file?.file_info {
//                
//                titleImageView.image = UIImage(named: tagGroupImage)
//            }
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "0.1.png")
        imageView.tintColor = .blue
        imageView.TagFileGradient(colorOne: .clear, colorTwo: .darkGray)
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //        label.backgroundColor = .red
        label.text = "Федеральный проект - 'Спорт - норма жизни'"
        label.textColor = .white
        label.numberOfLines = 5
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    
    func setupViews(){
        [titleImageView, titleLabel, separatorView].forEach { addSubview($0) }
        
        titleImageView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil,  padding: .init(top: 2, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 200))
        
        titleLabel.anchor(top: titleImageView.topAnchor, leading: titleImageView.leadingAnchor, trailing: titleImageView.trailingAnchor, bottom: nil, padding: .init(top: 10, left: 16, bottom: 0, right: 32), size: .init(width: 0, height: 180))
        
        separatorView.anchor(top: titleImageView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, padding: .init(top: 2, left: 16, bottom: 4, right: 16), size: .init(width: 0, height: 2))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
