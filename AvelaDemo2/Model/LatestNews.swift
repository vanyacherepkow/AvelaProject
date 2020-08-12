//
//  News.swift
//  AvelaDemo2
//
//  Created by Иван on 23.02.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import Foundation

//struct latestArray: Decodable {
//    let latestNews: [News]
//}

struct News: Decodable {
    
    let url: String?
    let id: String
    let transliteration_value: String
    let transliteration_id: String?
    let source_id: String?
    let source_name: String?
    let source_favicon: String?
    let source_type: String?
    let source_uri: String?
    let validate_status: String?
    let validate_by: String?
    let publication_date: String
    let added: String?
    let is_top: String?
    let title: String
    let annotation: String
    let content: String
    let file_info_id: String?
    let file_info_file: String?
    let file_info_variants: String?
    let tags: [Tags]?
    let mark: String?
    
}

struct Tags: Decodable {
    let tag_name: String?
}

