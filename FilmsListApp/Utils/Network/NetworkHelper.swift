//
//  NetworkHelper.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Moya

// MARK: - HTTPHeaderField
enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

// MARK: - ContentType
enum ContentType: String {
    case json = "application/json"
}

// MARK: - baseURL
extension TargetType {

    var baseURL: URL {
        return URL(string: "https://s3-eu-west-1.amazonaws.com")!
    }
}
