//
//  DetailFilmDetailFilmConfigurator.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

// MARK: - DetailFilmConfigurator
protocol DetailFilmConfigurator: class {
    
    func setFilmModel(_ filmModel: FilmModel)
}

// MARK: - DetailFilmConfiguratorImpl
class DetailFilmConfiguratorImpl: NSObject {

    // MARK: - Properties
    @IBOutlet private weak var viewController: DetailFilmViewController!
    weak var presenter: DetailFilmPresenterImpl?
    
    // MARK: - Methods
    override func awakeFromNib() {
        self.configure(viewController: viewController)
    }

    private func configure(viewController: DetailFilmViewController) {
        let router = DetailFilmRouterImpl()
        router.view = viewController

        let presenter = DetailFilmPresenterImpl.init(view: viewController, router: router)

        viewController.presenter = presenter
        viewController.configurator = self
        self.presenter = presenter
    }
}

// MARK: - DetailFilmConfigurator
extension DetailFilmConfiguratorImpl: DetailFilmConfigurator {
    
    func setFilmModel(_ filmModel: FilmModel) {
        presenter?.filmModel = filmModel
    }
}
