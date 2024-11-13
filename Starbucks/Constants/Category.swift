//
//  Category.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 4.11.2024.
//

import Foundation
import RealmSwift

enum Category: String, CaseIterable, PersistableEnum {
    case Frappuccino
    case Breakfast
    case Coffee
    case Food
    case Snack
}
