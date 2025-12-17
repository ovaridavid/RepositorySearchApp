//
//  RepositoryApiToDomainMapper.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import RepositorySearchAPI
import Foundation

struct RepositoryApiToDomainMapper {
    static func map(data: Repository) -> GitHubRepository {
        GitHubRepository(
            id: data.id,
            name: data.name,
            description: data.description,
            htmlURL: data.html_url,
            stars: data.stargazers_count,
            forks: data.forks_count,
            createdAt: data.created_at,
            lastUpdate: data.updated_at,
            owner: OwnerApiToDomainMapper.mapOwner(data.owner)
        )
    }
}
