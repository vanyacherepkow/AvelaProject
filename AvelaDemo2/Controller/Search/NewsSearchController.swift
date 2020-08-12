//
//  NewsSearchController.swift
//  AvelaDemo2
//
//  Created by Иван on 30.03.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

class NewsSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupSearchBar()
    }
    
    
    fileprivate func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
}
