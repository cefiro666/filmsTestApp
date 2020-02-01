//
//  NetworkDataFetcher.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Alamofire
import Foundation

// MARK: - DataFetcher protocol
protocol DataFetcher {
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

// MARK: - NetworkDataFetcher
class NetworkDataFetcher: DataFetcher {
    
    // MARK: - Methods
    func fetchData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        
        AF.request(urlString).responseDecodable(of: T.self,
                                                queue: DispatchQueue.main,
                                                decoder: JSONDecoder()) { (data) in
            
            switch data.result {
            case .success(let data):
                response(data)
                
            case .failure(let error):
                print(error.localizedDescription)
                response(nil)
            }
        }
    }
}
