//
//  FilmsListFilmsListPresenter.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

// MARK: - FilmsListPresenter
protocol FilmsListPresenter {
    
    init(view: FilmsListView, router: FilmsListRouter, getFilmsUsecase: GetFilmsUsecase)

    func showDetailFilmController(fromFilmModel filmModel: FilmModel)
    func viewDidLoad()
}

// MARK: - FilmsListPresenterImpl
class FilmsListPresenterImpl: FilmsListPresenter {
    
    // MARK: - Properties
    weak var view: FilmsListView?
    var router: FilmsListRouter?
    var getFilmsUsecase: GetFilmsUsecase?

    // MARK: - Inits
    required init(view: FilmsListView, router: FilmsListRouter, getFilmsUsecase: GetFilmsUsecase) {
        self.view = view
        self.router = router
        self.getFilmsUsecase = getFilmsUsecase
    }

    // MARK: - Methods
    func viewDidLoad() {
        getFilmsUsecase?.execute(completion: { (success, films, error) in
            if success {
                let filmModels = films?.map({ (film) -> FilmModel in
                    return FilmModel(from: film)
                })
                
                self.view?.setFilmModels(filmModels!)
                
            } else {
                
                self.view?.showErrorDownoadingFilms()
            }
        })
    }
    
    func showDetailFilmController(fromFilmModel filmModel: FilmModel) {
        self.router?.showDetailFilmControllerFromFilmModel(filmModel)
    }
}
