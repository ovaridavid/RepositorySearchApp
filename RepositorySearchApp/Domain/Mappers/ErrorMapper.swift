//
//  ErrorMapper.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 17..
//

import Foundation
import RepositorySearchAPI

struct RepositoryErrorMapper {
    static func map(_ error: Error) -> String {
        if let apiError = error as? RepositorySearchError {
            switch apiError {
            case .invalidURL:
                return "Invalid request"
            case .invalidResponse:
                return "Invalid server response"
            case .unauthorized:
                return "You are not authorized"
            case .notFound:
                return "Repository not found"
            case .httpError(let statusCode):
                return "Server error (\(statusCode))"
            }
        }
        
        if let urlError = error as? URLError {
            switch urlError.code {
            case .notConnectedToInternet:
                return "No internet connection"
            case .timedOut:
                return "The request timed out"
            default:
                return "Network error"
            }
        }
        return "Something went wrong"
    }
}
