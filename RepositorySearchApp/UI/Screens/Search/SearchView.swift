//
//  SearchView.swift
//  RepositorySearchApp
//
//  Created by Óvári Dávid on 2025. 12. 16..
//

import SwiftUI

struct SearchView: View {
    @State var viewModel: SearchViewModel
    let factory: ViewModelFactory

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()
                VStack(alignment: .leading, spacing: Constants.verticalLargeSpacing) {
                    @Bindable var vm = viewModel
                    TextField("What are you looking for?", text: $vm.query)
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
                        RepositoryListView(
                            viewModel: factory.makeRepositoryListViewModel(for: viewModel.query)
                        )
                    } label: {
                        Text("Search")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: Constants.verticalMediunSpacing)
                                    .fill(viewModel.isSearchEnabled ? Color(.systemBlue) : Color.gray)
                            )
                    }
                    .disabled(!viewModel.isSearchEnabled)
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
        static let lineWidth: CGFloat = 2.0
        static let textfieldOpacity: CGFloat = 0.5
    }
}
