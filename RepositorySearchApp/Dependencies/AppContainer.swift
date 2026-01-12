//
//  AppContainer.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI
import RepositorySearchAPI

@MainActor
protocol ViewModelFactory {
    func makeSearchViewModel() -> SearchViewModel
    func makeRepositoryListViewModel(for query: String) -> RepositoryListViewModel
}

final class AppContainer: ViewModelFactory {
    let gitHubClient: RepositorySearchAPIClientProtocol

    init(gitHubClient: RepositorySearchAPIClientProtocol = RepositorySearchAPIClient()) {
        self.gitHubClient = gitHubClient
    }

    func makeSearchViewModel() -> SearchViewModel {
        return SearchViewModel()
    }

    func makeRepositoryListViewModel(for query: String) -> RepositoryListViewModel {
        return RepositoryListViewModel(apiClient: gitHubClient, query: query)
    }
}
