//
//  HomeViewModel.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import Foundation
import Combine
import SwiftUI
import RealmSwift

// MARK: - Home ViewModel
class HomeViewModel: ObservableObject {
    @Published var popularMovies: [MovieViewModel] = []
    private var cancellables = Set<AnyCancellable>()
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
        fetchPopularMovies()
    }
    
    func fetchPopularMovies() {
        movieService.fetchMovies(endpoint: AppURLs.popularMoviePath)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("\(AppText.errorFetchingPopularMovies) \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movies in
                self?.popularMovies = movies.map { MovieMapper.apiModelToViewModel($0) }
            })
            .store(in: &cancellables)
    }
}
