//
//  RepositoryDetailViewModel.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Observation

@MainActor
@Observable
final class RepositoryDetailViewModel {
    let repository: GitHubRepository

    init(repository: GitHubRepository) {
        self.repository = repository
    }
}
