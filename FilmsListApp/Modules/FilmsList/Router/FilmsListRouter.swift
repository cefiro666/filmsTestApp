//
//  FilmsListFilmsListRouter.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

protocol FilmsListRouter {
    
    func showDetailFilmControllerFromFilmModel(_ filmModel: FilmModel)
}

class FilmsListRouterImpl: FilmsListRouter {

    weak var view: UIViewController?

    func showDetailFilmControllerFromFilmModel(_ filmModel: FilmModel) {
        guard let detailFilmViewController = UIViewController.getControllerFromType(DetailFilmViewController.self) else { return }
        
        detailFilmViewController.configurator?.setFilmModel(filmModel)
        self.view?.navigationController?.pushViewController(detailFilmViewController, animated: true)
    }
}
