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
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .success([
            Repository.mock,
            Repository.mock
        ])

        let viewModel = RepositoryListViewModel(apiClient: mockClient)

        // WHEN
        await viewModel.load(query: "swift")

        // THEN
        guard case .loaded(let repositories) = viewModel.state else {
            #expect(Bool(false), "Expected loaded state")
            return
        }

        #expect(repositories.count == 2)
        #expect(repositories[0].id == 19)
        #expect(repositories[1].id == 19)
    }


    @Test
    func givenApiError_whenLoadCalled_thenStateIsError() async {

        // GIVEN
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .failure(RepositorySearchError.notFound)

        let viewModel = RepositoryListViewModel(apiClient: mockClient)

        // WHEN
        await viewModel.load(query: "swift")

        // THEN
        guard case .error(let message) = viewModel.state else {
            #expect(Bool(false), "Expected error state")
            return
        }

        #expect(message == "Repository not found")
    }


    @Test
    func givenEmptyResult_whenLoadCalled_thenLoadedWithEmptyList() async {

        // GIVEN
        let mockClient = MockRepositorySearchAPIClient()
        mockClient.result = .success([])

        let viewModel = RepositoryListViewModel(apiClient: mockClient)

        // WHEN
        await viewModel.load(query: "swift1234321")

        // THEN
        #expect(viewModel.state == .empty)
    }
}
