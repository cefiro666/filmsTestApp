//
//  ImageCacheHelper.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 01.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

class ImageCacheHelper: NSObject {
    private static var cachedImages = NSCache<NSString, UIImage>()
    
    class func add(image: UIImage, fromUrl url: String) {
        cachedImages.setObject(image, forKey: url as NSString)
    }
    
    class func getImageFrom(url: String) -> UIImage? {
        return cachedImages.object(forKey: url as NSString)
    }
}
