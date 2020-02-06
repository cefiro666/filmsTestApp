//
//  DetailFilmDetailFilmPresenter.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

// MARK: - DetailFilmPresenter
protocol DetailFilmPresenter: class {
    
    init(view: DetailFilmView, router: DetailFilmRouter)
    func viewDidLoad()
}

// MARK: - DetailFilmPresenterImpl
class DetailFilmPresenterImpl: DetailFilmPresenter {

    // MARK: - Properties
    weak var view: DetailFilmView?
    var router: DetailFilmRouter?
    
    var filmModel: FilmModel?

    // MARK: - Methods
    required init(view: DetailFilmView, router: DetailFilmRouter) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
        self.view?.fillInfoFromFilmModel(filmModel!)
    }
}
