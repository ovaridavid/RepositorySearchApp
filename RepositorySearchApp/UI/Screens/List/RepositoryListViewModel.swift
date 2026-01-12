//
//  RepositoryListViewModel.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI
import RepositorySearchAPI

@MainActor
@Observable
final class RepositoryListViewModel {
    enum State: Equatable {
        case loading
        case loaded([GitHubRepository])
        case error(String)
        case empty
    }

    private(set) var state: State = .loading
    private let apiClient: RepositorySearchAPIClientProtocol
    private let query: String

    init(apiClient: RepositorySearchAPIClientProtocol, query: String) {
        self.apiClient = apiClient
        self.query = query
    }

    func loadRepositories() async {
        if case .loaded = state { return }

        state = .loading

        do {
            let apiRepositories = try await apiClient.searchRepositories(query: query)
            let domainRepositories = apiRepositories.map { RepositoryApiToDomainMapper.map(data: $0) }

            if domainRepositories.isEmpty {
                state = .empty
            } else {
                state = .loaded(domainRepositories)
            }
        } catch {
            state = .error(RepositoryErrorMapper.map(error))
        }
    }
}
