//
//  TagsChooseController.swift
//  AvelaDemo2
//
//  Created by Иван on 07.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class TagsChooseController: BaseListController, UICollectionViewDelegateFlowLayout{
    
    var tags = [Tagi]()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(red: 47/255, green: 68/255, blue: 78/255, alpha: 1.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Список тегов"
        self.navigationController?.navigationBar.backgroundColor = .white
        let topBar = UIView(frame: UIApplication.shared.statusBarFrame)
        topBar.backgroundColor = .white
        view.addSubview(topBar)
        
        if var textAttributes = navigationController?.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.red
            navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
        
        collectionView?.register(TagsChooseCell.self, forCellWithReuseIdentifier: cellId)
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return tags.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TagsChooseCell
        cell.tags = tags[indexPath.item]
        return cell
    }
}
