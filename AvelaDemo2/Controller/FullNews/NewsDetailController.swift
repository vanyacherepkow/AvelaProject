//
//  NewsDetailController.swift
//  AvelaDemo2
//
//  Created by Иван on 12.08.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit
import LBTATools

class NewsDetailController: BaseListController, UICollectionViewDelegateFlowLayout{
    
    let sourceNews: String
    let titleNews: String
    let publication_dateNews: String
    let anotationNews: String
    let imageNameNews: String
    let contentNews: String
    let sourceFaviconNews: String
    
    init(source_name: String, title: String, publication_date: String, annotationNews: String, imageName: String, content: String, sourceFavicon: String){
        self.sourceNews = source_name
        self.titleNews = title
        self.publication_dateNews = publication_date
        self.anotationNews = annotationNews
        self.imageNameNews = imageName
        self.contentNews = content
        self.sourceFaviconNews = sourceFavicon
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellId = "cellId"
    var tagNewsController: TagsInNewsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView?.register(NewsDetailCell.self, forCellWithReuseIdentifier: "cellId")
        
        //        fetchData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsDetailCell
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd.MM.yyyy"
        if let date = dateFormatterGet.date(from: publication_dateNews) {
            cell.infoLabel.setHTMLFromString(htmlText: sourceNews + "•" + dateFormatterPrint.string(from: date), colorLabel: "darkgray")
        }
        cell.annotationLabel.setHTMLFromString(htmlText: anotationNews)
        cell.contentLabel.setHTMLFromString(htmlText: contentNews)
        cell.titleLabel.setHTMLFromString(htmlText: titleNews)
        
        if sourceFaviconNews == ""{
            cell.sourceFavicon.constrainWidth(0)
            cell.sourceFavicon.constrainHeight(0)
        }else{
            cell.sourceFavicon.sd_setImage(with: URL(string: sourceFaviconNews ))
        }
        if imageNameNews == ""{
            cell.newsImage.constrainWidth(0)
            cell.newsImage.constrainHeight(0)
        }else{
            cell.newsImage.image = UIImage(named: imageNameNews)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 1200)
    }
    
}

