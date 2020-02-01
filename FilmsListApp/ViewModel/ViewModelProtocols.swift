//
//  ViewModelProtocols.swift
//  FilmsListApp
//
//  Created by Виталий Баник on 01.02.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - TypeObject
enum TypeObject {
    case yearObject
    case filmObject
}

// MARK: - DataObject
protocol DataObject {
    var typeObject: TypeObject { get }
    var year: Int { get set }
    var stringFromYear: String { get }
}

// MARK: - stringFromYear
extension DataObject {
    var stringFromYear: String {
        return String(year)
    }
}

// MARK: - YearObject
struct YearObject: DataObject {
    var typeObject: TypeObject {
        return .yearObject
    }
    
    var year: Int
}

// MARK: - FilmObject
struct FilmObject: DataObject {
    var typeObject: TypeObject {
        return .filmObject
    }
    
    var localizedName: String
    var name: String
    var year: Int
    var rating: Float?
    var imageUrl: String?
    var description: String?
}
