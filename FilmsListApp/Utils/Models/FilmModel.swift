//
//  FilmModel.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 01.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

struct FilmModel {

    let id: Int
    let localizedName: String
    let name: String
    let year: Int
    let rating: Float?
    let imageUrl: String?
    let description: String?
    
    var stringFromYear: String {
        return String(year)
    }
    
    init(from film: Film) {
        self.id =               film.id
        self.localizedName =    film.localizedName
        self.name =             film.name
        self.year =             film.year
        self.rating =           film.rating
        self.imageUrl =         film.imageURL
        self.description =      film.filmDescription
    }
}
