//
//  OwnerApiToDomainMapper.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import RepositorySearchAPI
import Foundation

struct OwnerApiToDomainMapper {
    static func mapOwner(_ data: Owner) -> GitHubOwner {
        GitHubOwner(
            username: data.login,
            avatarURL: data.avatar_url,
            profileURL: data.html_url
        )
    }
}
