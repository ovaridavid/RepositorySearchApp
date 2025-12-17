//
//  Repository+Mock.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Foundation
import RepositorySearchAPI

extension Repository {
    static var mock: Repository {
        Repository(
            id: 19,
            name: "Dávid's Repository",
            description: "iOS Test",
            html_url: URL(string: "https://github.com/ovaridavid/RepositorySearchAPI")!,
            stargazers_count: 36,
            forks_count: 99,
            created_at: Date(timeIntervalSince1970: 2_000),
            updated_at: Date(timeIntervalSince1970: 1_000),
            owner: .mock
        )
    }
}
