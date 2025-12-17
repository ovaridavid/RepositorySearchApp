//
//  OwnerApiToDomainMapperTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Testing
import RepositorySearchAPI
@testable import iOSTesztSwiftUI

struct OwnerApiToDomainMapperTests {

    @Test
    func givenApiOwner_whenMapped_thenDomainOwnerIsCorrect() {

        // GIVEN
        let apiOwner = Owner.mock

        // WHEN
        let domainOwner = OwnerApiToDomainMapper.mapOwner(apiOwner)

        // THEN
        #expect(domainOwner.username == "apple")
        #expect(domainOwner.avatarURL == apiOwner.avatar_url)
        #expect(domainOwner.profileURL == apiOwner.html_url)
    }
}
