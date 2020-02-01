//
//  DataFetcherService.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    // MARK: - Properties
    var dataFetcher: DataFetcher
    
    // MARK: - Inits
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    // MARK: - Methods
    func fetchFilms(completion: @escaping (FilmsList?) -> Void) {
        
        let urlJSONFilms = "https://s3-eu-west-1.amazonaws.com/sequeniatesttask/films.json"
        dataFetcher.fetchData(urlString: urlJSONFilms, response: completion)
    }
}
