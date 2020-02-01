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
    
    var yearObject: YearObject? {
        didSet {
            configureCellFromYearObject()
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
    
    private func configureCellFromYearObject() {
        yearLabel.text = yearObject?.stringFromYear
    }
}

// MARK: - InfoFromCell
extension YearCell: InfoFromCell {
    
    static var identifier: String {
        return "yearCell"
    }
}
