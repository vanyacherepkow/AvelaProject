//
//  BaseCell.swift
//  AvelaDemo2
//
//  Created by Иван on 28.01.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews(){
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemeted")
    }
}
