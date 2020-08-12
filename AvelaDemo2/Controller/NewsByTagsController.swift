//
//  NewsByTagsController.swift
//  AvelaDemo2
//
//  Created by Иван on 27.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class NewsByTagsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let tagId = "tagId"
    
    override func viewDidLoad() {
        
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: tagId)
        
        collectionView.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagId, for: indexPath) as! NewsCell
//        navigationController.controller
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 1000)
    }
    
}
