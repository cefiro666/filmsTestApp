//
//  ViewModel.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - DataObject
enum TypeObject {
    case yearObject
    case filmObject
}

protocol DataObject {
    var typeObject: TypeObject { get }
    var year: Int { get set }
    var stringFromYear: String { get }
}

extension DataObject {
    var stringFromYear: String {
        return String(year)
    }
}

struct YearObject: DataObject {
    var typeObject: TypeObject {
        return .yearObject
    }
    
    var year: Int
}

struct FilmObject: DataObject {
    var typeObject: TypeObject {
        return .filmObject
    }
    
    var localizedName: String
    var name: String
    var year: Int
    var rating: Float?
    var imageUrl: String?
    var description: String?
}

// MARK: - ViewModelDelegate
protocol ViewModelDelegate: AnyObject {
    func filmsDownloaded()
    func errorDownoadingFilms()
}

class ViewModel {
    
    // MARK: - Properties
    var customCellsArray = [DataObject]()
    
    private var dataFetcherService = DataFetcherService()
    weak var delegate: ViewModelDelegate?
    
    // MARK: - Inits
    init() {
        getFilms()
    }
    
    // MARK: - Methods
    private func getFilms() {
        dataFetcherService.fetchFilms { (filmList) in
            guard var films = filmList?.films else {
                self.delegate?.errorDownoadingFilms()
                return
            }
            
            let serviceWorkItem = DispatchWorkItem {
                self.sortedFilms(&films)
                self.fillCustomCellArray(from: &films)
            }
            
            DispatchQueue.global(qos: .utility).async(execute: serviceWorkItem)
            
            serviceWorkItem.notify(queue: DispatchQueue.main) {
                self.delegate?.filmsDownloaded()
            }
        }
    }
    
    private func sortedFilms(_ films: inout [Film]) {
        films.sort { (oneFilm, twoFilm) -> Bool in
            if oneFilm.year != twoFilm.year {
                return oneFilm.year < twoFilm.year
            } else {
                return (oneFilm.rating ?? 0) >= (twoFilm.rating ?? 0)
            }
        }
    }
    
    private func fillCustomCellArray(from films: inout [Film]) {
        var currentYear = 0
        
        for film in films {
            if film.year != currentYear {
                let yearCell = YearObject(year: film.year)
                customCellsArray.append(yearCell)
                
                currentYear = film.year
            }
            
            let filmCell = FilmObject(localizedName:    film.localized_name,
                                      name:             film.name,
                                      year:             film.year,
                                      rating:           film.rating,
                                      imageUrl:         film.image_url,
                                      description:      film.description)
            
            customCellsArray.append(filmCell)
        }
    }
}
