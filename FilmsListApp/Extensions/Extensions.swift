//
//  Extensions.swift
//  pocemonApp
//
//  Created by Виталий Баник on 12/10/2019.
//  Copyright © 2019 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - UIImageView
extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data) else {
                    return
            }
            
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

// MARK: - UILabel
extension UILabel {
    
    func setupLabel(forRating rating: Float) {
        switch rating {
        case 0.0..<5.0:
            self.textColor = #colorLiteral(red: 0.9607259631, green: 0.04118006676, blue: 0.05869088322, alpha: 1)
            
        case 5.0..<7.0:
            self.textColor = #colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)
            
        default:
            self.textColor = #colorLiteral(red: 0.1301344633, green: 0.4840399623, blue: 0.001282582292, alpha: 1)
        }

        self.text = "\(String(rating))"
    }
}
