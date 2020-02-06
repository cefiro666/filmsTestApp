//
//  FilmsListFilmsListViewController.swift
//  filmsTestApp
//
//  Created by Виталий Баник on 06/02/2020.
//  Copyright © 2020 MyCompany. All rights reserved.
//

import UIKit

// MARK: - FilmsListView
protocol FilmsListView: AnyObject {
    
    func showFilmsListFromModels(_ filmModels: [FilmModel])
    func showErrorDownoadingFilms()
}

// MARK: - FilmsListTableViewController
class FilmsListTableViewController: UITableViewController {

    // MARK: - Properties
    var presenter: FilmsListPresenter?
    var configurator: FilmsListConfigurator?
    
    private var filmModels = [FilmModel]()

    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Methods
    private func setup() {
        setupTitle()
        setupTable()
    }
    
    private func setupTitle() {
        self.navigationItem.title = "films".localized
    }

    private func setupTable() {
        let filmCellNib = UINib(nibName: FilmCell.identifier, bundle: nil)
        self.tableView.register(filmCellNib, forCellReuseIdentifier: FilmCell.identifier)
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableView.automaticDimension
    }

    private func updateTable() {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    // MARK: - Refresh
    @IBAction func refreshData(_ sender: Any) {
        presenter?.viewDidLoad()
    }
    
    // MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let filmCell = tableView.dequeueReusableCell(withIdentifier: FilmCell.identifier) as? FilmCell else {
            return UITableViewCell()
        }
        
        filmCell.filmModel = filmModels[indexPath.row]
        
        return filmCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmModel = filmModels[indexPath.row]
        presenter?.showDetailFilmController(fromFilmModel: filmModel)
    }
}

// MARK: - FilmsListView
extension FilmsListTableViewController: FilmsListView {
    func showFilmsListFromModels(_ filmModels: [FilmModel]) {
        self.filmModels = filmModels
        updateTable()
    }
    
    func showErrorDownoadingFilms() {
        self.showAlert(title: "errorAlert".localized,
                       message: "errorAlertMessage".localized) {
                        
                        
        }
    }
}
