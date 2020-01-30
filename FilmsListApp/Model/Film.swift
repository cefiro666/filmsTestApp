//
//  Film.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

struct FilmsList: Decodable {
    var films: [Film]
}

struct Film: Decodable {
    var id: Int
    var name: String
    var localized_name: String
    var year: Int
    var rating: Float?
    var image_url: String?
    var description: String?
}
