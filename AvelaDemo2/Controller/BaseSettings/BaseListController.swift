//
//  BaseListController.swift
//  AvelaDemo2
//
//  Created by Иван on 24.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
