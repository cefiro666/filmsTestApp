//
//  NetworkHelper.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Moya

// MARK: - FilmProvider
enum FilmProvider {
    case getFilms
}

// MARK: - TargetType
extension FilmProvider: TargetType {
    
    var path: String {
        switch self {
        case .getFilms:
            return "/sequeniatesttask/films.json"
        }
    }
    
    var method: Method {
        switch self {
        case .getFilms:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFilms:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers: [String : String] =  [
            HTTPHeaderField.acceptType.rawValue : ContentType.json.rawValue
        ]
        
        return headers
    }
}
