//
//  FilmViewController.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 30.01.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

protocol FilmController {
    
    var filmObject: FilmObject? { get set }
}

class FilmViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var descriptionText: UITextView!
    
    private var _filmObject: FilmObject?
    
    // MARK: - ViewController life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInfo()
        setupPoster()
    }
    
    private func setupInfo() {
        guard let filmObject = filmObject else {
            return
        }
        
        navigationItem.title = filmObject.localizedName
        nameLabel.text = filmObject.name
        yearLabel.text = "year".localized + filmObject.stringFromYear
        ratingLabel.setupLabel(forRating: filmObject.rating)
        descriptionText.text = filmObject.description ?? "noDescription".localized
    }
    
    private func setupPoster() {
        guard let imageUrlString = filmObject?.imageUrl else {
            return
        }
        
        if let image = ImageCacheHelper.getImageFrom(url: imageUrlString) {
            posterImageView.image = image
        } else {
            posterImageView.downloaded(from: imageUrlString)
        }
    }
}

// MARK: - FilmController
extension FilmViewController: FilmController {
    
    var filmObject: FilmObject? {
        get {
            return _filmObject
        }
        set {
            _filmObject = newValue
        }
    }
}
