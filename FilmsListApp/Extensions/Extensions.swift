//
//  Extensions.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 01/02/2020.
//  Copyright © 2019 Виталий Баник. All rights reserved.
//

import Alamofire
import UIKit

// MARK: - UIImageView
extension UIImageView {
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        AF.request(link).responseData { (data) in
            switch data.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    
                    ImageCacheHelper.add(image: image, fromUrl: link)
                    self.transition(fromImage: image)
                }

            case .failure(let error):
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func transition(fromImage image: UIImage) {
        UIView.transition(with: self,
                          duration: 0.75,
                          options: .transitionFlipFromRight,
                          animations: {
                            
                            self.image = image
                            
                        }, completion: nil)
    }
}

// MARK: - UILabel
extension UILabel {
    
    func setupLabel(forRating rating: Float?) {
        guard let rating = rating else {
            self.text = "-"
            self.textColor = #colorLiteral(red: 0.3707730174, green: 0.370819658, blue: 0.3707520962, alpha: 1)
            return
        }
        
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

// MARK: - UIViewController
extension UIViewController {
    
    func showAlert(title: String, message: String, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true) {
            completion()
        }
    }
}

// MARK: - String
extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
