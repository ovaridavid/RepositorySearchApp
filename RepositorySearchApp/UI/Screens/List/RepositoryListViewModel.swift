//
//  RepositoryListViewModel.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import RepositorySearchAPI
import Observation

@MainActor
@Observable
final class RepositoryListViewModel {
    enum State: Equatable {
        case loading
        case loaded([GitHubRepository])
        case error(String)
        case empty
    }

    var state: State = .loaded([])

    private let apiClient: RepositorySearchAPIClientProtocol

    init(apiClient: RepositorySearchAPIClientProtocol) {
        self.apiClient = apiClient
    }

    func load(query: String) async {
        state = .loading

        do {
            let apiRepositories = try await apiClient.searchRepositories(query: query)
            let domainRepositories = apiRepositories.map { (repository: Repository) in
                RepositoryApiToDomainMapper.map(data: repository)
            }

            if domainRepositories.isEmpty {
                state = .empty
            } else {
                state = .loaded(domainRepositories)
            }
        } catch {
            state = .error(
                RepositoryErrorMapper.map(error)
            )
        }
    }
}
