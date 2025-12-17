//
//  RepositoryErrorMapperTests.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Testing
import RepositorySearchAPI
@testable import iOSTesztSwiftUI

struct RepositoryErrorMapperTests {

    @Test
    func givenInvalidUrlError_whenMapped_thenCorrectMessageReturned() {

        // GIVEN
        let error = RepositorySearchError.invalidURL

        // WHEN
        let message = RepositoryErrorMapper.map(error)

        // THEN
        #expect(message == "Invalid request")
    }

    @Test
    func givenInvalidResponseError_whenMapped_thenCorrectMessageReturned() {

        // GIVEN
        let error = RepositorySearchError.invalidResponse

        // WHEN
        let message = RepositoryErrorMapper.map(error)

        // THEN
        #expect(message == "Invalid server response")
    }

    @Test
    func givenUnauthorizedResponseError_whenMapped_thenCorrectMessageReturned() {

        // GIVEN
        let error = RepositorySearchError.unauthorized

        // WHEN
        let message = RepositoryErrorMapper.map(error)

        // THEN
        #expect(message == "You are not authorized")
    }

    @Test
    func givenNotFoundResponseError_whenMapped_thenCorrectMessageReturned() {

        // GIVEN
        let error = RepositorySearchError.notFound

        // WHEN
        let message = RepositoryErrorMapper.map(error)

        // THEN
        #expect(message == "Repository not found")
    }

    @Test
    func givenUnknownError_whenMapped_thenGenericMessageReturned() {

        // GIVEN
        struct UnknownError: Error {}
        let error = UnknownError()

        // WHEN
        let message = RepositoryErrorMapper.map(error)

        // THEN
        #expect(message == "Something went wrong")
    }
}
