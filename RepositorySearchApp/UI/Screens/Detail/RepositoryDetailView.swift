//
//  RepositoryDetailView.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

struct RepositoryDetailView: View {
    let viewModel: RepositoryDetailViewModel

    init(repository: GitHubRepository) {
        self.viewModel = RepositoryDetailViewModel(repository: repository)
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    headerSection
                    Divider()
                    descriptionSection
                    statsSection
                }
                .padding()
            }

            VStack {
                Spacer()
                openInBrowserButton
            }
        }
        .navigationTitle(viewModel.repository.name)
    }

    private var headerSection: some View {
        HStack {
            AsyncImage(url: viewModel.repository.owner.avatarURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: Constants.imageSize, height: Constants.imageSize)
            .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(viewModel.repository.owner.username)
                    .font(.headline)
                Link("GitHub profile", destination: viewModel.repository.owner.profileURL)
                    .buttonStyle(.plain)
                    .foregroundStyle(.blue)
            }
        }
    }

    @ViewBuilder
    private var descriptionSection: some View {
        if let description = viewModel.repository.description {
            Text(description)
                .font(.body)
        }
    }

    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            statRow(icon: Constants.starImage, text: "\(viewModel.repository.stars)")
            statRow(icon: Constants.forkImage, text: "\(viewModel.repository.forks)")
            statRow(icon: Constants.updateImage, text: viewModel.repository.lastUpdate.formatted(date: .abbreviated, time: .omitted))
            statRow(icon: Constants.creationImage, text: viewModel.repository.createdAt.formatted(date: .abbreviated, time: .omitted))
        }
    }

    private func statRow(icon: String, text: String) -> some View {
        HStack(spacing: Constants.mediumHorizontalSpacing) {
            Image(systemName: icon)
                .frame(width: 20)
            Text(text)
        }
    }

    private var openInBrowserButton: some View {
        Link(destination: viewModel.repository.htmlURL) {
            HStack {
                Image(systemName: Constants.safariImage)
                Text("Check out this repository")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, Constants.spacing)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: Constants.spacing)
                    .fill(Color.blue)
            )
        }
        .padding(.horizontal)
        .padding(.bottom, Constants.spacing)
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
