//
//  CoffeeSize.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 5.11.2024.
//

import Foundation
import RealmSwift

enum CoffeeSize: String, CaseIterable, PersistableEnum {
    case Tall
    case Grande
    case Venti
}
