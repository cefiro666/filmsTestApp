//
//  ImageCacheHelper.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 01.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class ImageCacheHelper: NSObject {
    
    // MARK: - Properties
    private static var cachedImages = NSCache<NSString, UIImage>()
    
    // MARK: - Methods
    class func add(image: UIImage, fromUrl url: String) {
        self.cachedImages.setObject(image, forKey: url as NSString)
    }
    
    class func getImageFrom(url: String) -> UIImage? {
        return self.cachedImages.object(forKey: url as NSString)
    }
}
