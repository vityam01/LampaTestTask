//
//  FavoritesViewModel.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI
import RealmSwift


class FavoritesViewModel: ObservableObject {
    @Published var topRatedMovies: [MovieViewModel] = []
    private var realm: Realm
    private var notificationToken: NotificationToken?

    init() {
        self.realm = try! Realm()
        fetchFavorites()
        observeRealmChanges()
    }
    
    func fetchFavorites() {
        let favoriteMovies = realm.objects(MovieRealmModel.self)
            .filter("isFavourite == true")
            .sorted(byKeyPath: "voteAverage", ascending: false)
            .map { MovieMapper.realmModelToViewModel($0) }
        
        self.topRatedMovies = Array(favoriteMovies)
    }

    func observeRealmChanges() {
        notificationToken = realm.objects(MovieRealmModel.self).observe { [weak self] changes in
            switch changes {
            case .initial, .update(_, _, _, _):
                self?.fetchFavorites()
            case .error(let error):
                print("\(AppText.errorObservingRealm) \(error)")
            }
        }
    }

    deinit {
        notificationToken?.invalidate()
    }
}


