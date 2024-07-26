//
//  HomeView.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.popularMovies) { movie in
                        NavigationLink(destination: MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))) {
                            MovieRow(movie: movie)
                        }
                    }
                }
            }
            .background(AppColor.mainBackground)
            .navigationBarTitle(AppText.movies, displayMode: .inline)
        }
    }
}




#Preview {
    HomeView()
}
