//
//  SearchViewModel.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Observation

@MainActor
@Observable
final class SearchViewModel {
    var query: String = ""
    var navigateToList: Bool = false
    var isSearchEnabled: Bool {
        !query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func searchTapped() {
        navigateToList = true
    }
}
