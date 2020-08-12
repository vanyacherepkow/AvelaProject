//
//  ArticleCell.swift
//  AvelaDemo2
//
//  Created by Иван on 01.02.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit
import LBTATools

class NewsDetailCell: UICollectionViewCell {
    
    private let tagId = "tagId"
    let tagNewsController = TagsInNewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sourceFavicon.constrainWidth(20)
        sourceFavicon.constrainHeight(20)
        titleLabel.sizeToFit()
        
        newsImage.contentMode = .scaleAspectFit
        newsImage.clipsToBounds = true
        
        let content = "<p><strong>Министерство спорта Российской Федерации</strong> поздравляет женскую сборную России и тренерский штаб с завоеванием бронзовых наград на Чемпионате мира в Японии и желает новых высоких достижений и ярких побед!</p><p><a href=\"https://gov-news.ru/news/1027886\" target=\"_blank\">Госновости.РФ</a>&nbsp;</p>"
        contentLabel.setHTMLFromString(htmlText: content)
        
        originalButton.layer.cornerRadius = 5
        originalButton.layer.borderWidth = 1
        originalButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        originalButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        originalButton.tintColor = .white
        
        
        favoritesButton.layer.cornerRadius = 5
        favoritesButton.layer.borderWidth = 1
        favoritesButton.layer.borderColor = #colorLiteral(red: 0.1606041193, green: 0.2344800234, blue: 0.2712118626, alpha: 1)
        favoritesButton.backgroundColor = #colorLiteral(red: 0.5449770689, green: 0.7717760205, blue: 0.2509875894, alpha: 1)
        favoritesButton.tintColor = .white
        
        let buttonsSV = UIStackView(arrangedSubviews: [
        originalButton,
        favoritesButton
        ])
        
        buttonsSV.spacing = 12
        buttonsSV.distribution = .fillProportionally
        buttonsSV.alignment = .fill
        buttonsSV.constrainHeight(50)
        
        let tagSV = HorizontalStackView(arrangedSubviews: [
            tagsNameLabel,
            tagNewsController.view
        ], spacing: 12)
        tagSV.constrainHeight(90)
        
        tagsNameLabel.sizeToFit()
        
        let stackView = VerticalStackView(arrangedSubviews: [
            HorizontalStackView(arrangedSubviews: [
                sourceFavicon,
                infoLabel
            ], spacing: 8),
            titleLabel,
            markLabel,
            annotationLabel,
            tagUpSV,
            tagSV,
            tagDownSV,
            newsImage,
            contentLabel,
            buttonSepView,
            buttonsSV
        ], spacing: 16)
        addSubview(stackView)
        stackView.distribution = .fillProportionally
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 12, left: 16, bottom: 12, right: 16), size: .init(width: frame.width - 16 - 16, height: frame.height - 12 - 12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let sourceFavicon = UIImageView(cornerRadius: 0)
    
    let infoLabel = UILabel(text: "V1.ru • 24.01.2020", font: .systemFont(ofSize: 12), textColor: .gray)
    
    let titleLabel = UILabel(text: "Женская сборная России по гандболу - бронзовый призер Чемпионата мира", font: .systemFont(ofSize: 20), numberOfLines: 0)
    
    let markLabel = UILabel(text: "Нейтраяльная", font: .systemFont(ofSize: 16))
    
    let tagsNameLabel = UILabel(text: "Теги: ", font: .systemFont(ofSize: 18))
    
    let annotationLabel = UILabel(text: "С 30 ноября по 15 декабря в Кумамото (Япония) прошел Чемпионат мира по гандболу среди женщин. Сборная России выиграла 'бронзу', обыграв в мачте за третье место команду Норвегии со счетом 33:28.", font: .systemFont(ofSize: 18), numberOfLines: 0)
    
    let buttonSepView: UIView = {
        let sepView = UIView()
        sepView.backgroundColor = .darkGray
        sepView.constrainWidth(0)
        sepView.constrainHeight(1)
        return sepView
    }()
    
    let tagUpSV: UIView = {
        let sepView = UIView()
        sepView.backgroundColor = .darkGray
        sepView.constrainWidth(0)
        sepView.constrainHeight(1)
        return sepView
    }()
    
    let tagDownSV: UIView = {
        let sepView = UIView()
        sepView.backgroundColor = .darkGray
        sepView.constrainWidth(0)
        sepView.constrainHeight(1)
        return sepView
    }()
    
    let newsImage = UIImageView(cornerRadius: 0)
    
    let contentLabel = UILabel(font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    let originalButton = UIButton(title: "Показать оригинал")
    
    let favoritesButton = UIButton(title: "В избранное")
    
    
    
}

