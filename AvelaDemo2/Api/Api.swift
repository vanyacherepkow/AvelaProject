//
//  Api.swift
//  AvelaDemo2
//
//  Created by Иван on 24.02.2020.
//  Copyright © 2020 vanyacherepkow. All rights reserved.
//

import UIKit
import Alamofire

class Api: NSObject{
    
    static let shared = Api()
    
    let baseUrl = "http://localhost:1337"
    
    func login(email: String, password: String, completion: @escaping (Result<Data>) -> ()){
        print("performing login")
        let params = ["emailAddress": email, "password": password]
        let url = "\(baseUrl)/api/v1/entrance/login"
        print(url)
        Alamofire.request(url, method: .put, parameters: params, encoding: URLEncoding()).validate(statusCode: 200..<300).responseData { (dataResponse) in
            if let err = dataResponse.error{
                completion(.failure(err))
                print(err)
            }else{
                completion(.success(dataResponse.data ?? Data()))
            }
        }
    }
    
    func logout(completion: @escaping (Result<Data>) -> ()){
        print("performing logout")
        let url = "\(baseUrl)/api/v1/account/logout"
        print(url)
        Alamofire.request(url)
            .validate(statusCode: 200..<300)
            .responseData { (dataResponse) in
            if let err = dataResponse.error{
                completion(.failure(err))
                print(err)
            }else{
                completion(.success(dataResponse.data ?? Data()))
            }
        }
    }
    
    func fetchLatestNews(completion: @escaping (News?, Error?) -> ()){
        fetchAppGroup(urlString: "http://127.0.0.1:5500/AvelaDemo2/json/avela5.json", completion: completion)
    }
    
    func fetchAppGroup(urlString: String, completion: @escaping (News?, Error?) -> Void){
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    //    func fetchLatestNews(searchTerm: String, completion: @escaping (News?, Error?) -> ()){
    //
    //        let urlString = "http://127.0.0.1:5500/AvelaDemo2/json/avela5.json"
    //
    //        fetchGenericJSONData(urlString: urlString, completion: completion)
    //    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) ->()) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                completion(objects, nil)
            }catch{
                completion(nil, error)
            }
            
        }.resume()
    }
    
}
