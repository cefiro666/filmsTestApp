//
//  FilmsListViewController.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class FilmsListViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var filmsTableView: UITableView!
    @IBOutlet weak var downloadIndicator: UIActivityIndicatorView!
    
    private var viewModel = ViewModel()
    
    // MARK: VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.delegate = self
        
        setupFilmsTable()
    }
    
    // MARK: Methods
    private func setupFilmsTable() {
        filmsTableView.estimatedRowHeight = 44
        filmsTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func showFilmsTable() {
        downloadIndicator.stopAnimating()
        filmsTableView.isHidden = false
        filmsTableView.reloadData()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Возникла ошибка!",
                                      message: "Скорее всего вы не подключены к интернету или нет доступа к серверу. Попробуйте позже.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true) {
            self.downloadIndicator.stopAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFilm" {
            guard
                let filmViewController = segue.destination as? FilmViewController,
                let film = sender as? Film else {
                    return
            }
            
            filmViewController.film = film
        }
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate
extension FilmsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.customCellsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeObject = viewModel.customCellsArray[indexPath.row].typeObject
        
        switch typeObject {
        case .yearObject:
            guard let yearCell = tableView.dequeueReusableCell(withIdentifier: "yearCell") as? YearCell else {
                return YearCell()
            }
            
            let yearObject = viewModel.customCellsArray[indexPath.row] as! YearObject
            yearCell.setYear(year: yearObject.year)
            
            return yearCell
            
        case .filmObject:
            guard let filmCell = tableView.dequeueReusableCell(withIdentifier: "filmCell") as? FilmCell else {
                return FilmCell()
            }
            
            let filmObject = viewModel.customCellsArray[indexPath.row] as! FilmObject
            filmCell.setInfoForFilm(localName: filmObject.film.localized_name,
                                        name: filmObject.film.name,
                                        rating: filmObject.film.rating)
            
            return filmCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard viewModel.customCellsArray[indexPath.row].typeObject != .yearObject else {
            return
        }
        
        let filmObject = viewModel.customCellsArray[indexPath.row] as! FilmObject
        let film = filmObject.film
        
        performSegue(withIdentifier: "showFilm", sender: film)
    }
}

// MARK: ViewModelDelegate
extension FilmsListViewController: ViewModelDelegate {
    func filmsDownloaded() {
        showFilmsTable()
    }
    
    func errorDownoadingFilms() {
        showAlert()
    }
}
