//
//  InfoFilmViewCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class InfoFilmCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var posterImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    
    var filmModel: FilmModel? {
        didSet {
            configure()
        }
    }
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
    
    private func configure() {
        setupInfo()
        setupPoster()
    }

    private func setupInfo() {
        guard let filmModel = filmModel else {
            return
        }
        
        nameLabel.text = filmModel.name
        yearLabel.text = "year".localized + filmModel.stringFromYear
        ratingLabel.setupLabel(forRating: filmModel.rating)
    }
    
    private func setupPoster() {
        guard let imageUrlString = filmModel?.imageUrl else {
            return
        }
        
        if let image = ImageCacheHelper.getImageFrom(url: imageUrlString) {
            posterImage.image = image
        } else {
            posterImage.downloaded(from: imageUrlString)
        }
    }
}
