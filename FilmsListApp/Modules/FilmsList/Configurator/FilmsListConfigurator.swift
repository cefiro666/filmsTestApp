//
//  FilmsListFilmsListConfigurator.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

// MARK: - FilmsListConfigurator
protocol FilmsListConfigurator: class {
    
}

// MARK: - FilmsListConfiguratorImpl
class FilmsListConfiguratorImpl: NSObject, FilmsListConfigurator {

    // MARK: - Properties
    @IBOutlet private weak var viewController: FilmsListTableViewController!
    weak var presenter: FilmsListPresenterImpl?

    // MARK: - Methods
    override func awakeFromNib() {

        self.configure(viewController: viewController)
    }

    private func configure(viewController: FilmsListTableViewController) {

        let router = FilmsListRouterImpl()
        router.view = viewController

        let getFilmUsecase = GetFilmUsecaseImpl()
        
        let presenter = FilmsListPresenterImpl.init(view: viewController,
                                                    router: router,
                                                    getFilmsUsecase: getFilmUsecase)

        viewController.presenter = presenter
        viewController.configurator = self
        
        self.presenter = presenter
    }
}
