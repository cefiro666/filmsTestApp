//
//  FilmsListFilmsListPresenter.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

protocol FilmsListPresenter {
    init(view: FilmsListView, router: FilmsListRouter, getFilmsUsecase: GetFilmsUsecase)

    func showDetailFilmController(fromFilmModel filmModel: FilmModel)
    func viewDidLoad()
}

class FilmsListPresenterImpl: FilmsListPresenter {
    
    weak var view: FilmsListView?
    var router: FilmsListRouter?
    var getFilmsUsecase: GetFilmsUsecase?

    required init(view: FilmsListView, router: FilmsListRouter, getFilmsUsecase: GetFilmsUsecase) {
        self.view = view
        self.router = router
        self.getFilmsUsecase = getFilmsUsecase
    }

    func viewDidLoad() {
        getFilmsUsecase?.execute(completion: { (success, films, error) in
            if success {
                let filmModels = films?.map({ (film) -> FilmModel in
                    return FilmModel(from: film)
                })
                
                self.view?.showFilmsListFromModels(filmModels!)
            } else {
                self.view?.showErrorDownoadingFilms()
            }
        })
    }
    
    func showDetailFilmController(fromFilmModel filmModel: FilmModel) {
        router?.showDetailFilmControllerFromFilmModel(filmModel)
    }
}
