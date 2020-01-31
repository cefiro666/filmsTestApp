//
//  FilmCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var localizedNameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var substraiteView: UIView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        substraiteView.layer.cornerRadius = 7
    }
    
    func setInfoForFilm(localName: String, name: String, rating: Float?) {
        localizedNameLabel.text = localName
        nameLabel.text = name
        
        guard let rating = rating else {
            ratingLabel.text = "-"
            ratingLabel.textColor = #colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)
            return
        }
            
        ratingLabel.setupLabel(forRating: rating)
    }
}
