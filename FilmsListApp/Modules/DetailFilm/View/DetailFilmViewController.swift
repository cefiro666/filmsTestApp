//
//  DetailFilmDetailFilmViewController.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit
// MARK: - DetailFilmView
protocol DetailFilmView: AnyObject {
    
    func fillInfoFromFilmModel(_ filmModel: FilmModel)
}

// MARK: - Sections enum
private enum Sections: Int {
    
    case info
    case description
    case sectionsCount
}

// MARK: - DetailFilmViewController
class DetailFilmViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    
    var presenter: DetailFilmPresenter?
    var configurator: DetailFilmConfigurator?
    
    private var filmModel: FilmModel!

    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Methods
    private func setupTable() {
        let infoCellNib = UINib(nibName: InfoFilmCell.identifier, bundle: nil)
        let descriptionCellNib = UINib(nibName: DescriptionFilmCell.identifier, bundle: nil)
        
        tableView.register(infoCellNib, forCellReuseIdentifier: InfoFilmCell.identifier)
        tableView.register(descriptionCellNib, forCellReuseIdentifier: DescriptionFilmCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
    }

    private func setupController() {
        navigationItem.title = filmModel.localizedName
        tableView.reloadData()
    }
}

// MARK: - DetailFilmView
extension DetailFilmViewController: DetailFilmView {
    
    func fillInfoFromFilmModel(_ filmModel: FilmModel) {
        self.filmModel = filmModel
        setupController()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailFilmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.sectionsCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Sections.info.rawValue:
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: InfoFilmCell.identifier) as? InfoFilmCell else {
                return UITableViewCell()
            }
            
            infoCell.filmModel = filmModel
            
            return infoCell
            
        case Sections.description.rawValue:
            guard let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionFilmCell.identifier) as? DescriptionFilmCell else {
                return UITableViewCell()
            }
            
            descriptionCell.filmModel = filmModel
            
            return descriptionCell
            
        default:
            return UITableViewCell()
        }
    }
}
