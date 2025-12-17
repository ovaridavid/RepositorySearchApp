//
//  Owner+Mock.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Foundation
import RepositorySearchAPI

extension Owner {
    static var mock: Owner {
        Owner(
            login: "apple",
            avatar_url: URL(string: "https://avatars.githubusercontent.com/u/10639145")!,
            html_url: URL(string: "https://github.com/apple")!
        )
    }
}
