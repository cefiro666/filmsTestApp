//
//  Film.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

//MARK: - Films
struct Films: Codable {
    
    let films: [Film]
}

//MARK: - Film
struct Film: Codable {
    
    let id: Int
    let localizedName, name: String
    let year: Int
    let rating: Float?
    let imageURL: String?
    let filmDescription: String?
    let genres: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case localizedName = "localized_name"
        case name, year, rating
        case imageURL = "image_url"
        case filmDescription = "description"
        case genres
    }
}
