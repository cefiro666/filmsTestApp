//
//  YearCell.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class YearCell: UITableViewCell {

    // MARK: - Properties
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var substraiteView: UIView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        substraiteView.layer.cornerRadius = 7
    }
    
    func setYear(year: Int) {
        yearLabel.text = String(year)
    }
}
