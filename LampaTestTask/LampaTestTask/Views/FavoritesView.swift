//
//  FavoritesView.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI


struct FavoritesView: View {
    @StateObject private var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationView {
            if !viewModel.topRatedMovies.isEmpty {
                ScrollView {
                    ForEach(viewModel.topRatedMovies) { movie in
                        NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))) {
                            MovieRow(movie: movie)
                                .padding(.vertical, 8)
                        }
                        .listRowBackground(AppColor.mainBackground)
                    }
                }
                .padding(.horizontal, 10)
                .background(AppColor.mainBackground.edgesIgnoringSafeArea(.all))
                .navigationTitle(AppText.topRatedMovies)
            } else {
                Text(AppText.listIsEmpty)
                    .font(.custom(RalewayFontNames.bold, size: 18))
            }
        }
        .onAppear {
            viewModel.fetchFavorites()
        }
    }
}
