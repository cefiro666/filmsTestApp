//
//  GetFilmsUsecases.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import Moya

// MARK: - GetFilmsUsecase
protocol GetFilmsUsecase {
    
    func execute(completion: (@escaping (_ success: Bool, _ films: [Film]?, _ errorMessage: String?) -> Void))
}

// MARK: - GetFilmUsecaseImpl
class GetFilmUsecaseImpl {
    
    let provider = MoyaProvider<FilmProvider>()
}

// MARK: - GetFilmsUsecase
extension GetFilmUsecaseImpl: GetFilmsUsecase {
    
    func execute(completion: @escaping ((Bool, [Film]?, String?) -> Void)) {
        
        self.provider.request(.getFilms) { result in
            switch result {
            case .success(let response):
                guard let films = try? response.map(Films.self).films else {
                    completion(false, nil, "Decoding error!")
                    return
                }
                
                completion(true, films, nil)
                
            case .failure(let error):
                let errorDescription = error.localizedDescription
                completion(false, nil, errorDescription)
            }
        }
    }
}
