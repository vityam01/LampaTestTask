//
//  MovieDetailViewModel.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI
import RealmSwift

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieViewModel
    @Published var isFavorite: Bool = false
    
    private var realm: Realm
    private var notificationToken: NotificationToken?
    
    init(movie: MovieViewModel) {
        self.movie = movie
        self.realm = try! Realm()
        checkIfFavorite()
        observeRealmChanges()
    }
    
    func saveToFavorites() {
        try? realm.write {
            var realmModel: MovieRealmModel
            
            if let existingMovie = realm.object(ofType: MovieRealmModel.self, forPrimaryKey: movie.id) {
                realmModel = existingMovie
            } else {
                realmModel = MovieMapper.viewModelToRealmModel(movie)
            }
            
            isFavorite.toggle()
            realmModel.isFavourite = isFavorite
            realm.add(realmModel, update: .modified)
        }
    }
    
    private func checkIfFavorite() {
        if let existingMovie = realm.object(ofType: MovieRealmModel.self, forPrimaryKey: movie.id) {
            isFavorite = existingMovie.isFavourite
        } else {
            isFavorite = false
        }
    }
    
    private func observeRealmChanges() {
        notificationToken = realm.objects(MovieRealmModel.self).observe { [weak self] changes in
            switch changes {
            case .initial:
                self?.checkIfFavorite()
            case .update(_, _, _, _):
                self?.checkIfFavorite()
            case .error(let error):
                print("\(AppText.errorObservingRealm) \(error)")
            }
        }
    }
    
    deinit {
        notificationToken?.invalidate()
    }
}



