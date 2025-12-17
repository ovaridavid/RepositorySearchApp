//
//  RepositoryListView.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

struct RepositoryListView: View {
    @State private var viewModel: RepositoryListViewModel

    init(viewModel: RepositoryListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }

    var body: some View {
        content
            .navigationTitle("Repositories")
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .loaded(let repositories):
            List(repositories) { repository in
                NavigationLink {
                    RepositoryDetailView(repository: repository)
                } label: {
                    RepositoryCell(repository: repository)
                }
            }

        case .error(let message):
            Text(message)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .empty:
            Text("Nothing to see here ☹️")
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
