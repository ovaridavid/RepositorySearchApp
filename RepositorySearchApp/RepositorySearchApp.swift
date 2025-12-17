//
//  RepositorySearchApp.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI
import RepositorySearchAPI

@main
struct RepositorySearchApp: App {
    private let apiClient: RepositorySearchAPIClientProtocol

    init() {
        self.apiClient = RepositorySearchAPIClient()
    }

    var body: some Scene {
        WindowGroup {
            SearchView(apiClient: apiClient)
        }
    }
}
