//
//  DetailFilmDetailFilmRouter.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

// MARK: - DetailFilmRouter
protocol DetailFilmRouter {
    
    func closeController()
}

// MARK: - DetailFilmRouterImpl
class DetailFilmRouterImpl {

    // MARK: - Properties
    weak var view: UIViewController?
}

// MARK: - DetailFilmRouter
extension DetailFilmRouterImpl: DetailFilmRouter {
    
    func closeController() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
