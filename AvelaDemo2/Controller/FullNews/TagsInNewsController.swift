//
//  TagNewsController.swift
//  AvelaDemo2
//
//  Created by Иван on 29.03.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class TagsInNewsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let tagsCellId = "tagsCellId"
    
    var tags = [Tagi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.isScrollEnabled = false
        
        collectionView.register(TagsInNewsCell.self, forCellWithReuseIdentifier: tagsCellId)
        fetchData()
    }
    
    fileprivate func fetchData(){
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.notify(queue: .main){
            self.tags = [
                Tagi.init(nameTag: "Экономика и политика"),
                Tagi.init(nameTag: "Минспорт РФ")
            ]
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tagsCellId, for: indexPath) as! TagsInNewsCell
        cell.tags = tags[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 24 - 24 - 8 - 8, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 24, bottom: 0, right: 24)
    }
}
