//
//  DescriptionFilmViewCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 06.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class DescriptionFilmCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet weak var descriptionText: UITextView!
    
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
        guard let filmModel = filmModel else {
            return
        }
        
        descriptionText.text = filmModel.description ?? "noDescription".localized
    }
}
