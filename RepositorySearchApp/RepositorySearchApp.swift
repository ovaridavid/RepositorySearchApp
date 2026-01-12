//
//  RepositorySearchApp.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

@main
struct RepositorySearchApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: container.makeSearchViewModel(), factory: container)
        }
    }
}
