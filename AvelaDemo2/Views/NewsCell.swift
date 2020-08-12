//
//  NewsCell.swift
//  AvelaDemo2
//
//  Created by Иван on 31.01.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    var news: MVP!{
        didSet{
            if let sourceName = news?.source_name {
                let dateFormatterGet = DateFormatter()
                dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                let dateFormatterPrint = DateFormatter()
                dateFormatterPrint.dateFormat = "dd.MM.yyyy"
                if let date = dateFormatterGet.date(from: news!.publication_date) {
                    sourceLabel.setHTMLFromString(htmlText: sourceName + "•" + dateFormatterPrint.string(from: date), colorLabel: "darkgray")
                }
            }
            
            if let titleNews = news?.title{
                titleNewsLabel.setHTMLFromString(htmlText: titleNews)
            } else {
            }
            
            if let annotationNews = news?.annotation{
                annotationNewsLabel.setHTMLFromString(htmlText: annotationNews)
            }
            if let imageName = news?.file_info_file{
                if imageName == ""{
                    newsImageView.constrainWidth(constant: 0)
                    newsImageView.constrainHeight(constant: 0)
                }else{
                    newsImageView.image = UIImage(named: imageName)
                }
            }
            
            if let favicon = news?.source_favicon{
                if favicon == ""{
                    sourceFavicon.constrainWidth(constant: 0)
                    sourceFavicon.constrainHeight(constant: 0)
                }else{
                    sourceFavicon.sd_setImage(with: URL(string: news.source_favicon ?? ""))
                }
            }
        }
    }
    
    //    var latestNews: News?{
    //        didSet{
    //            if let sourceName = latestNews?.source_name {
    //                sourceLabel.text = (sourceName + "•" + (latestNews?.publication_date)!)
    //            }
    //
    //            if let titleNews = latestNews?.title{
    //                titleNewsLabel.text = titleNews
    //            } else {
    //            }
    //
    //            if let annotationNews = latestNews?.annotation{
    //                annotationNewsLabel.setHTMLFromString(htmlText: annotationNews)
    //            }
    //            if let imageName = latestNews?.file_info_file{
    //                if imageName == ""{
    //                    newsImageView.constrainWidth(constant: 0)
    //                    newsImageView.constrainHeight(constant: 0)
    //                }else{
    //                newsImageView.image = UIImage(named: imageName)
    //                }
    //            }
    //        }
    //    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        newsImageView.contentMode = .scaleAspectFit
        newsImageView.clipsToBounds = true
        
        sourceFavicon.constrainWidth(constant: 20)
        sourceFavicon.constrainHeight(constant: 20)
        sourceFavicon.contentMode = .scaleAspectFit
        sourceFavicon.clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            newsImageView,
            HorizontalStackView(arrangedSubviews: [
                sourceFavicon,
                sourceLabel], spacing: 18),
            titleNewsLabel,
            annotationNewsLabel
        ], spacing: 12)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        addSubview(separatorView)
        separatorView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 1))
    }
    
    let sourceFavicon = UIImageView()
    
    let sourceLabel = UILabel(text: "V1.ru • 24.01.2020", font: UIFont.systemFont(ofSize: 16), textColor: .gray)
    
    let newsImageView = UIImageView(cornerRadius: 20)
    
    let titleNewsLabel =  UILabel(font: UIFont.systemFont(ofSize: 18), numberOfLines: 0)
    
    let annotationNewsLabel = UILabel(font: UIFont.systemFont(ofSize: 20), numberOfLines: 0)
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
