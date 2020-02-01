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
    
    var filmObject: FilmObject? {
        didSet {
            configureCellFromFilmObject()
        }
    }
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        substraiteView.layer.cornerRadius = 5
    }
    
    private func configureCellFromFilmObject() {
        localizedNameLabel.text = filmObject?.localizedName
        nameLabel.text = filmObject?.name
        ratingLabel.setupLabel(forRating: filmObject?.rating)
    }
}

// MARK: - InfoFromCell
extension FilmCell: InfoFromCell {
    
    static var identifier: String {
        return "filmCell"
    }
}
