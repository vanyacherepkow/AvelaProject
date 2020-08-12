//
//  TagChooseCell.swift
//  AvelaDemo2
//
//  Created by Иван on 10.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class TagsChooseCell: UICollectionViewCell {
    
    var tags: Tagi!{
        didSet{
            tagLabel.text = tags.nameTag
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tagLabel)
        tagLabel.fillSuperview()
        tagLabel.textColor = .white
        tagLabel.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        tagLabel.font = UIFont.systemFont(ofSize: 22)
        tagLabel.textInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    let tagLabel = UILabelWithInsets()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}
