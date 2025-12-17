//
//  AppContainer.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import Observation
import RepositorySearchAPI

final class AppContainer {
    let gitHubClient: RepositorySearchAPIClientProtocol

    init(gitHubClient: RepositorySearchAPIClientProtocol = RepositorySearchAPIClient()) {
        self.gitHubClient = gitHubClient
    }
}
