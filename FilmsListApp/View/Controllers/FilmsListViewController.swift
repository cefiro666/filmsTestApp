//
//  FilmsListViewController.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

protocol FilmsListController: ViewModelDelegate {
    
    var viewModel: ViewModel { get set }
    
    func filmsDownloaded()
    func errorDownoadingFilms()
}

class FilmsListViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var filmsTableView: UITableView!
    @IBOutlet private weak var downloadIndicator: UIActivityIndicatorView!
    
    private var _viewModel = ViewModel()
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.delegate = self
        
        setupTitle()
        setupFilmsTable()
    }
    
    // MARK: - Methods
    private func setupTitle() {
        navigationItem.title = "films".localized
    }
    
    private func setupFilmsTable() {
        filmsTableView.estimatedRowHeight = 44
        filmsTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func showFilmsTable() {
        downloadIndicator.stopAnimating()
        filmsTableView.isHidden = false
        filmsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilm" {
            guard
                var filmController = segue.destination as? FilmController,
                let filmObject = sender as? FilmObject else {
                    return
            }
            
            filmController.filmObject = filmObject
        }
    }
}

// MARK: - FilmsListController
extension FilmsListViewController: FilmsListController {
    
    var viewModel: ViewModel {
        get {
            return _viewModel
        }
        set {
            _viewModel = newValue
        }
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FilmsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.objectsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeObject = viewModel.objectsArray[indexPath.row].typeObject
        
        switch typeObject {
        case .yearObject:
            guard let
                yearCell = tableView.dequeueReusableCell(withIdentifier: YearCell.identifier) as? YearCell,
                let yearObject = viewModel.objectsArray[indexPath.row] as? YearObject else {
                    
                return YearCell()
            }
            
            yearCell.yearObject = yearObject
            return yearCell
            
        case .filmObject:
            guard
                let filmCell = tableView.dequeueReusableCell(withIdentifier: FilmCell.identifier) as? FilmCell,
                let filmObject = viewModel.objectsArray[indexPath.row] as? FilmObject else {
                    
                return FilmCell()
            }
            
            filmCell.filmObject = filmObject
            return filmCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            viewModel.objectsArray[indexPath.row].typeObject != .yearObject,
            let filmObject = viewModel.objectsArray[indexPath.row] as? FilmObject else {
            
            return
        }
        
        performSegue(withIdentifier: "showFilm", sender: filmObject)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

// MARK: - ViewModelDelegate
extension FilmsListViewController: ViewModelDelegate {
    
    func filmsDownloaded() {
        showFilmsTable()
    }
    
    func errorDownoadingFilms() {
        self.showAlert(title: "errorAlert".localized,
                       message: "errorAlertMessage".localized) {
                        
            self.downloadIndicator.stopAnimating()
        }
    }
}
