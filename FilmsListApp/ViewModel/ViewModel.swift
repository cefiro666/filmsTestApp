//
//  ViewModel.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

//// MARK: - ViewModelDelegate
//protocol ViewModelDelegate: AnyObject {
//    func filmsDownloaded()
//    func errorDownoadingFilms()
//}
//
//class ViewModel {
//    
//    // MARK: - Properties
//    var objectsArray = [DataObject]()
//    
//    let getFilmsUsecase: GetFilmsUsecase = GetFilmUsecaseImpl()
//
//    weak var delegate: ViewModelDelegate?
//    
//    // MARK: - Inits
//    init() {
//        getFilms()
//    }
//    
//    // MARK: - Methods
//    private func getFilms() {
//        getFilmsUsecase.execute(completion: { (success, films, error) in
//            guard var films = films else {
//                self.delegate?.errorDownoadingFilms()
//                return
//            }
//            
//            let serviceWorkItem = DispatchWorkItem {
//                self.sortedFilms(&films)
//                self.fillObjectArray(from: &films)
//            }
//            
//            DispatchQueue.global(qos: .utility).async(execute: serviceWorkItem)
//            
//            serviceWorkItem.notify(queue: DispatchQueue.main) {
//                self.delegate?.filmsDownloaded()
//            }
//        })
//    }
//    
//    private func sortedFilms(_ films: inout [Film]) {
//        films.sort { (oneFilm, twoFilm) -> Bool in
//            if oneFilm.year != twoFilm.year {
//                return oneFilm.year < twoFilm.year
//            } else {
//                return (oneFilm.rating ?? 0) >= (twoFilm.rating ?? 0)
//            }
//        }
//    }
//    
//    private func fillObjectArray(from films: inout [Film]) {
//        var currentYear = 0
//        
//        for film in films {
//            if film.year != currentYear {
//                let yearObject = YearObject(year: film.year)
//                objectsArray.append(yearObject)
//                
//                currentYear = film.year
//            }
//            
//            let filmObject = FilmModel(localizedName:      film.localizedName,
//                                      name:                 film.name,
//                                      year:                 film.year,
//                                      rating:               film.rating,
//                                      imageUrl:             film.imageURL,
//                                      description:          film.filmDescription)
//            
//            objectsArray.append(filmObject)
//        }
//    }
//}
