//
//  RepositoryDetailViewModelTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Testing
import Foundation
@testable import iOSTesztSwiftUI

@MainActor
struct RepositoryDetailViewModelTests {

    @Test
    func givenInjectedDomainRepository_whenViewModelInitialized_thenRepositoryIsPassedThroughToView() {

        // GIVEN
        let owner = GitHubOwner(
            username: "apple",
            avatarURL: URL(string: "https://example.com/avatar.png")!,
            profileURL: URL(string: "https://github.com/apple")!
        )

        let repository = GitHubRepository(
            id: 1,
            name: "swift",
            description: "Swift programming language",
            htmlURL: URL(string: "https://github.com/apple/swift")!,
            stars: 100,
            forks: 50,
            createdAt: Date(timeIntervalSince1970: 1_000),
            lastUpdate: Date(timeIntervalSince1970: 2_000),
            owner: owner
        )

        // WHEN
        let viewModel = RepositoryDetailViewModel(repository: repository)

        // THEN
        #expect(viewModel.repository == repository)
    }
}
