//
//  RealmDatabase.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 12.11.2024.
//

import Foundation
import RealmSwift

final class RealmDatabase: LocalDatabaseProtocol {
    private let realm = try! Realm()

    func add<T>(model: T) where T: Object {
        try? realm.write {
            realm.add(model)
        }
    }

    func clearAll<T>(model: T.Type) where T: Object {
        let objects = realm.objects(model.self)

        try? realm.write {
            realm.delete(objects)
        }
    }

    func items<T: Object>() -> [T] {
        return realm.objects(T.self).filter { !$0.isInvalidated }.map { $0 }
    }

    func delete<T>(model: T) where T: Object {
        if model.isInvalidated {
            return
        }

        try? realm.write {
            realm.delete(model)
        }
    }

    func deleteFromId<T>(model: T.Type, id: String) where T: Object {
        guard let objectId = try? ObjectId(string: id) else { return }
        let item = realm.objects(model.self).filter("id == %@", objectId).first

        guard let validItem = item, !validItem.isInvalidated else {
            return
        }

        try? realm.write {
            realm.delete(validItem)
        }
    }
}
