//
//  FullNews.swift
//  AvelaDemo2
//
//  Created by Иван on 27.03.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit

//struct News: Decodable {
//    
//    let id: String?
//    let source_name: String?
//    let publication_date: String?
//    let title: String?
//    let mark: String?
//    let annotation: String?
//    let tags: [Tags]?
//    let news_file_image: String?
//    let content: String?
//    let source_uri: String?
//    
////    static func fetchDetailNews(competionHandler: @escaping(NewsInfo) -> ()){
////        let urlString = "http://127.0.0.1:5500/AvelaDemo2/json/\(id)"
////            
////            URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
////                if error != nil{
////                    print(error)
////                    return
////                }
////                
////                do{
////                    let JSONResponse = try JSONDecoder().decode([News].self, from: data!)
////    //                let response = JSONResponse.self
////    //                print(JSONResponse)
////                    DispatchQueue.main.async {
////                        competionHandler(JSONResponse)
////                    }
////                }catch let err{
////                    print(err)
////                }
////            }.resume()
////        }
//    
//}
//
//struct Tags: Decodable{
//    let tag_name: String?
//}
