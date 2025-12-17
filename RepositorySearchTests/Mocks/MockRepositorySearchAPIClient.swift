//
//  MockRepositorySearchAPIClient.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import RepositorySearchAPI

final class MockRepositorySearchAPIClient: RepositorySearchAPIClientProtocol {

    var result: Result<[Repository], Error>!

    func searchRepositories(query: String) async throws -> [Repository] {
        try result.get()
    }

    func repositoryDetail(owner: String, name: String) async throws -> Repository {
        fatalError("Not needed here")
    }
}
