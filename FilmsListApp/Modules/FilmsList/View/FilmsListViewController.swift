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
    
    func setFilmModels(_ filmModels: [FilmModel])
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
        
        self.setup()
        self.presenter?.viewDidLoad()
    }
    
    // MARK: - Methods
    private func setup() {
        self.setupTitle()
        self.setupTable()
    }
    
    private func setupTitle() {
        self.navigationItem.title = "films".localized
    }

    private func setupTable() {
        let filmCellNib = UINib(nibName: FilmCell.identifier, bundle: nil)
        self.tableView.register(filmCellNib, forCellReuseIdentifier: FilmCell.identifier)
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableView.automaticDimension
        self.refreshControl?.beginRefreshing()
    }

    private func updateTable() {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    // MARK: - Refresh
    @IBAction func refreshData(_ sender: Any) {
        self.presenter?.viewDidLoad()
    }
    
    // MARK: - TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let filmCell = tableView.dequeueReusableCell(withIdentifier: FilmCell.identifier) as? FilmCell else {
            return UITableViewCell()
        }
        
        filmCell.filmModel = self.filmModels[indexPath.row]
        
        return filmCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmModel = self.filmModels[indexPath.row]
        self.presenter?.showDetailFilmController(fromFilmModel: filmModel)
    }
}

// MARK: - FilmsListView
extension FilmsListTableViewController: FilmsListView {
    
    func setFilmModels(_ filmModels: [FilmModel]) {
        self.filmModels = filmModels
        self.updateTable()
    }
    
    func showErrorDownoadingFilms() {
        self.showAlert(title: "errorAlert".localized, message: "errorAlertMessage".localized)
    }
}
