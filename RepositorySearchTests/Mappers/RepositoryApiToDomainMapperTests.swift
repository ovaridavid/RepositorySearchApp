//
//  RepositoryApiToDomainMapperTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Testing
import Foundation
import RepositorySearchAPI
@testable import iOSTesztSwiftUI

struct RepositoryApiToDomainMapperTests {

    @Test
    func givenApiRepository_whenMapped_thenDomainRepositoryIsCorrect() async {

        // GIVEN
        let apiOwner = Owner.mock

        let createdAt = Date(timeIntervalSince1970: 2_000)
        let updatedAt = Date(timeIntervalSince1970: 1_000)

        let apiRepository = Repository.mock

        // WHEN
        let domainRepository: GitHubRepository =
        RepositoryApiToDomainMapper.map(data: apiRepository)

        // THEN
        #expect(domainRepository.id == 19)
        #expect(domainRepository.name == "Dávid's Repository")
        #expect(domainRepository.description == "iOS Test")
        #expect(domainRepository.htmlURL == apiRepository.html_url)
        #expect(domainRepository.stars == 36)
        #expect(domainRepository.forks == 99)
        #expect(domainRepository.createdAt == createdAt)
        #expect(domainRepository.lastUpdate == updatedAt)

        // THEN
        let domainOwner = domainRepository.owner
        #expect(domainOwner.username == apiOwner.login)
        #expect(domainOwner.avatarURL == apiOwner.avatar_url)
        #expect(domainOwner.profileURL == apiOwner.html_url)
    }
}

