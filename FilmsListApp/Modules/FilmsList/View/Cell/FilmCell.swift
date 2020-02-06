//
//  FilmCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var localizedNameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var substraiteView: UIView!
    
    var filmModel: FilmModel? {
        didSet {
            configure()
        }
    }
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.selectionStyle = .none
        substraiteView.layer.cornerRadius = 5
    }
    
    private func configure() {
        localizedNameLabel.text = filmModel?.localizedName
        nameLabel.text = filmModel?.name
        ratingLabel.setupLabel(forRating: filmModel?.rating)
    }
}
