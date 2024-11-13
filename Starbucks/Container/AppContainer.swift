//
//  AppContainer.swift
//  Starbucks
//
//  Created by Hüseyin Umut Kardaş on 13.11.2024.
//

import Swinject

final class AppContainer {
    static let shared = AppContainer()
    private let container: Container

    private init() {
        self.container = Container()
        registerDependencies()
    }

    var database: RealmDatabase {
        guard let instance = container.resolve(RealmDatabase.self) else {
            fatalError("RealmDatabase not found")
        }
        return instance
    }

    private func registerDependencies() {
        container.register(RealmDatabase.self) { _ in RealmDatabase() }
    }
}
