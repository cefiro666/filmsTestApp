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
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    
    var film: Film!
    
    private var rating: Float = 0.0 {
        didSet {
            switch rating {
            case 0.0..<5.0:
                ratingLabel.textColor = #colorLiteral(red: 0.9607259631, green: 0.04118006676, blue: 0.05869088322, alpha: 1)
                
            case 5.0..<7.0:
                ratingLabel.textColor = #colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)
                
            default:
                ratingLabel.textColor = #colorLiteral(red: 0.1301344633, green: 0.4840399623, blue: 0.001282582292, alpha: 1)
            }
            
            ratingLabel.text = "\(String(rating))"
        }
    }
    
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
            self.rating = rating
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
