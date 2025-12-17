//
//  SearchView.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI
import RepositorySearchAPI

struct SearchView: View {
    @State private var query: String = ""
    @State private var viewModel: RepositoryListViewModel

    init(apiClient: RepositorySearchAPIClientProtocol) {
        _viewModel = State(
            wrappedValue: RepositoryListViewModel(apiClient: apiClient)
        )
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                VStack(alignment: .leading, spacing: Constants.verticalLargeSpacing) {
                    TextField("What are you looking for?", text: $query)
                        .autocorrectionDisabled()
                        .padding(.horizontal)
                        .padding(.vertical, Constants.verticalMediunSpacing)
                        .background(
                            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                                .stroke(Color(.systemBlue).opacity(Constants.textfieldOpacity), lineWidth: Constants.lineWidth)
                        )

                    Spacer()
                }
                .padding()

                VStack {
                    Spacer()

                    NavigationLink {
                        RepositoryListView(viewModel: viewModel)
                    } label: {
                        Text("Search")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: Constants.verticalMediunSpacing)
                                    .fill(Color(.systemBlue))
                            )
                    }
                    .simultaneousGesture(
                        TapGesture().onEnded {
                            Task {
                                await viewModel.load(query: query)
                            }
                        }
                    )
                    .disabled(query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    .opacity(
                        query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0
                    )
                    .padding(.horizontal)
                    .padding(.bottom, Constants.verticalMediunSpacing)
                }
            }
            .navigationTitle("Repository Search")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Constants
private extension SearchView {
    enum Constants {
        static let verticalMediunSpacing: CGFloat = 16.0
        static let verticalLargeSpacing: CGFloat = 20.0
        static let cornerRadius: CGFloat = 12.0
        static let lineWidth: CGFloat = 2
        static let textfieldOpacity: CGFloat = 0.5
    }
}
