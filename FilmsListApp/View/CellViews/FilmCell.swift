//
//  FilmCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class FilmCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet private weak var localizedNameLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var substraiteView: UIView!
    
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
            
            ratingLabel.text = String(rating)
        }
    }
    
    // MARK: Methods
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
            
        self.rating = rating
    }
}
