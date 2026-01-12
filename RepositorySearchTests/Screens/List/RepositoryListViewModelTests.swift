//
//  RepositoryListViewModelTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Testing
import RepositorySearchAPI
@testable import iOSTesztSwiftUI

@MainActor
struct RepositoryListViewModelTests {

    @Test
    func givenSuccessfulApiResponse_whenLoadCalled_thenStateIsLoaded() async {

        // GIVEN
        let query = "swift"
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .success([
            Repository.mock,
            Repository.mock
        ])

        let viewModel = RepositoryListViewModel(apiClient: mockClient, query: query)

        // WHEN
        await viewModel.loadRepositories()

        // THEN
        if case .loaded(let repositories) = viewModel.state {
            #expect(repositories.count == 2)
            #expect(repositories[0].id == 19)
        } else {
            Issue.record("Expected .loaded state, but got \(viewModel.state)")
        }
    }

    @Test
    func givenApiError_whenLoadCalled_thenStateIsError() async {

        // GIVEN
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .failure(RepositorySearchError.notFound)

        let viewModel = RepositoryListViewModel(apiClient: mockClient, query: "swift")

        // WHEN
        await viewModel.loadRepositories()

        // THEN
        if case .error(let message) = viewModel.state {
            #expect(message == "Repository not found")
        } else {
            Issue.record("Expected .error state")
        }
    }

    @Test
    func givenEmptyResult_whenLoadCalled_thenLoadedWithEmptyList() async {

        // GIVEN
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .success([])

        let viewModel = RepositoryListViewModel(apiClient: mockClient, query: "swift1234321")

        // WHEN
        await viewModel.loadRepositories()

        // THEN
        #expect(viewModel.state == .empty)
    }
}
