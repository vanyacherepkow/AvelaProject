//
//  MVP.swift
//  AvelaDemo2
//
//  Created by Иван on 29.04.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import Foundation

struct MVP {
    
    let url: String?
    let id: String
    let transliteration_value: String
    let transliteration_id: String?
    let source_id: String?
    let source_name: String
    let source_favicon: String?
    let source_type: String?
    let source_uri: String?
    let validate_status: String?
    let validate_by: String?
    let publication_date: String
    let added: String
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

struct Tagi {
    let nameTag: String
}

struct User{
    let email: String
    let password: String
}
