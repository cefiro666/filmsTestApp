//
//  NetworkDataFetcher.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

// MARK: DataFetcher protocol
protocol DataFetcher {
    func fetchJSONData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void)
}

// MARK: NetworkDataFetcher
class NetworkDataFetcher: DataFetcher {
    
    // MARK: Properties
    var networking: Networking
    
    // MARK: Inits
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    // MARK: Methods
    func fetchJSONData<T>(urlString: String, response: @escaping (T?) -> Void) where T : Decodable {
        networking.request(urlString: urlString) { (data, error) in
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }

            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)

        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {
            return nil
        }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
