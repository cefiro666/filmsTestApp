//
//  FilmViewController.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class FilmViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionText: UITextView!
    
    var film: Film!
    
    // MARK: VC life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInfo()
        setupPoster()
    }
    
    // MARK: Methods
    private func setupInfo() {
        navigationItem.title = film.localized_name
        
        nameLabel.text = film.name
        yearLabel.text = "Год: \(String(film.year))"
        descriptionText.text = film.description ?? "Описание отсутствует"
        
        if let rating = film.rating {
            ratingLabel.setupLabel(forRating: rating)
        } else {
            ratingLabel.text = "-"
            ratingLabel.textColor = #colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)
        }
    }
    
    private func setupPoster() {
        guard let imageUrlString = film.image_url else {
            return
        }
        
        posterImageView.downloaded(from: imageUrlString)
    }
}
