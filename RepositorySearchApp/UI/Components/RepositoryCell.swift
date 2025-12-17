//
//  RepositoryCell.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

struct RepositoryCell: View {

    let repository: GitHubRepository

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.verticalSpacing) {
            Text(repository.name)
                .font(.headline)
                .foregroundColor(.primary)

            if let description = repository.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(Constants.lineLimit)
            }

            HStack(spacing: Constants.largeHorizontalSpacing) {
                HStack(spacing: Constants.smallHorizontalSpacing) {
                    Image(systemName: Constants.starImage)
                    Text("\(repository.stars)")
                }

                HStack(spacing: Constants.smallHorizontalSpacing) {
                    Image(systemName: Constants.updateImage)
                    Text(repository.lastUpdate.formatted(date: .abbreviated, time: .omitted))
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding(.vertical, Constants.verticalSpacing)
    }
}

// MARK: - Constants
private extension RepositoryCell {
    enum Constants {
        static let largeHorizontalSpacing: CGFloat = 16.0
        static let smallHorizontalSpacing: CGFloat = 4.0
        static let verticalSpacing: CGFloat = 8.0
        static let lineLimit: Int = 2
        static let starImage: String = "star.fill"
        static let updateImage: String = "arrow.triangle.2.circlepath"
    }
}
