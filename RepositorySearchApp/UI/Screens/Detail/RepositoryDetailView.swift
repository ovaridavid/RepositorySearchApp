//
//  RepositoryDetailView.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

struct RepositoryDetailView: View {
    @State private var viewModel: RepositoryDetailViewModel

    init(repository: GitHubRepository) {
        _viewModel = State(
            wrappedValue: RepositoryDetailViewModel(repository: repository)
        )
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    HStack {
                        AsyncImage(url: viewModel.repository.owner.avatarURL) { (image: Image) in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: Constants.imageSize,
                               height: Constants.imageSize)
                        .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(viewModel.repository.owner.username)
                            Link("GitHub profile",
                                 destination: viewModel.repository.owner.profileURL)
                            .buttonStyle(.plain)
                            .foregroundStyle(.link)
                        }
                    }

                    Divider()

                    if let description = viewModel.repository.description {
                        Text(description)
                    }

                    HStack(spacing: Constants.mediumHorizontalSpacing) {
                        Image(systemName: Constants.starImage)
                        Text("\(viewModel.repository.stars)")
                    }
                    HStack(spacing: Constants.mediumHorizontalSpacing) {
                        Image(systemName: Constants.forkImage)
                        Text("\(viewModel.repository.forks)")
                    }
                    HStack(spacing: Constants.mediumHorizontalSpacing) {
                        Image(systemName: Constants.updateImage)
                        Text("\(viewModel.repository.lastUpdate.formatted())")
                    }
                    HStack(spacing: Constants.mediumHorizontalSpacing) {
                        Image(systemName: Constants.creationImage)
                        Text("\(viewModel.repository.createdAt.formatted())")
                    }
                }
                .padding()
            }

            VStack {
                Spacer()

                Link(destination: viewModel.repository.htmlURL) {
                    HStack {
                        Image(systemName: Constants.safariImage)
                        Text("Check out this repository")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    .padding(.vertical, Constants.spacing)
                    .background(
                        RoundedRectangle(cornerRadius: Constants.spacing)
                            .fill(Color(.systemBlue))
                    )
                }
                .buttonStyle(.plain)
                .padding(.bottom, Constants.spacing)
            }
        }
        .navigationTitle(viewModel.repository.name)
    }
}

// MARK: - Constants
private extension RepositoryDetailView {
    enum Constants {
        static let spacing: CGFloat = 16.0
        static let imageSize: CGFloat = 60.0
        static let mediumHorizontalSpacing: CGFloat = 8.0
        static let starImage: String = "star.fill"
        static let updateImage: String = "arrow.triangle.2.circlepath"
        static let forkImage: String = "tuningfork"
        static let creationImage: String = "calendar"
        static let safariImage: String = "safari"
    }
}
