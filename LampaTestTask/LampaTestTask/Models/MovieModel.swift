//
//  Datamodels.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import Foundation
import RealmSwift

//MARK: MovieAPIModel
struct MovieAPIModel: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}


//MARK: MovieRealmModel
class MovieRealmModel: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String = ""
    @Persisted var overview: String = ""
    @Persisted var posterPath: String = ""
    @Persisted var releaseDate: String = ""
    @Persisted var voteAverage: Double = 0.0
    @Persisted var isFavourite: Bool = false
}


//MARK: MovieViewModel
struct MovieViewModel: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    let isFavourite: Bool
}
