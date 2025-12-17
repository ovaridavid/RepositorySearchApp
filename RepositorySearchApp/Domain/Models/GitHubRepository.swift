//
//  GitHubRepository.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Foundation

struct GitHubRepository: Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let htmlURL: URL
    let stars: Int
    let forks: Int
    let createdAt: Date
    let lastUpdate: Date
    let owner: GitHubOwner
}

