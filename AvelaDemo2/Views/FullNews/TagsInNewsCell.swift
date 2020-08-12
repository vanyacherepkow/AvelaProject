//
//  TagsInNewsCell.swift
//  AvelaDemo2
//
//  Created by Иван on 26.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class TagsInNewsCell: UICollectionViewCell {
    
    var tags: Tagi!{
        didSet{
            tagsLabel.setHTMLFromString(htmlText: tags.nameTag)
        }
    }
    
    let tagsLabel = UILabel(text: "Tag", font: .systemFont(ofSize: 14))
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tagsLabel)
        tagsLabel.fillSuperview()
        tagsLabel.sizeToFit()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
