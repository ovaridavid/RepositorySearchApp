//
//  SearchViewModelTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Testing
@testable import iOSTesztSwiftUI

@MainActor
struct SearchViewModelTests {

    @Test
    func givenEmptyQuery_whenCheckingIsSearchEnabled_thenReturnsFalse() {

        // GIVEN
        let viewModel = SearchViewModel()
        viewModel.query = ""

        // WHEN
        let isEnabled = viewModel.isSearchEnabled

        // THEN
        #expect(isEnabled == false)
    }

    @Test
    func givenWhitespaceQuery_whenCheckingIsSearchEnabled_thenReturnsFalse() {

        // GIVEN
        let viewModel = SearchViewModel()
        viewModel.query = "   \n  "

        // WHEN
        let isEnabled = viewModel.isSearchEnabled

        // THEN
        #expect(isEnabled == false)
    }

    @Test
    func givenValidQuery_whenCheckingIsSearchEnabled_thenReturnsTrue() {

        // GIVEN
        let viewModel = SearchViewModel()
        viewModel.query = "swift"

        // WHEN
        let isEnabled = viewModel.isSearchEnabled

        // THEN
        #expect(isEnabled == true)
    }

    @Test
    func givenSearchTapped_thenNavigateToListBecomesTrue() {

        // GIVEN
        let viewModel = SearchViewModel()
        #expect(viewModel.navigateToList == false)

        // WHEN
        viewModel.searchTapped()

        // THEN
        #expect(viewModel.navigateToList == true)
    }
}

