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
    
    init() {
        fetchPopularMovies()
    }
    
    func fetchPopularMovies() {
        MovieAPI.shared.fetchMovies(endpoint: AppURLs.popularMoviePath)
            .map { $0.map { MovieMapper.apiModelToViewModel($0) } }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("\(AppText.errorFetchingPopularMovies) \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] movies in
                self?.popularMovies = movies
            })
            .store(in: &cancellables)
    }
}
