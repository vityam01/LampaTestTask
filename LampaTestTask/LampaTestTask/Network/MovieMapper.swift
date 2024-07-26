//
//  MovieMapper.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 26.07.2024.
//

import Foundation


struct MovieMapper {

    static func apiModelToRealmModel(_ apiModel: MovieAPIModel) -> MovieRealmModel {
        let realmModel = MovieRealmModel()
        realmModel.id = apiModel.id
        realmModel.title = apiModel.title
        realmModel.overview = apiModel.overview
        realmModel.posterPath = apiModel.posterPath
        realmModel.releaseDate = apiModel.releaseDate
        realmModel.voteAverage = apiModel.voteAverage
        return realmModel
    }
    
    static func realmModelToViewModel(_ realmModel: MovieRealmModel) -> MovieViewModel {
        return MovieViewModel(
            id: realmModel.id,
            title: realmModel.title,
            overview: realmModel.overview,
            posterPath: realmModel.posterPath,
            releaseDate: realmModel.releaseDate,
            voteAverage: realmModel.voteAverage,
            isFavourite: realmModel.isFavourite
        )
    }

    static func apiModelToViewModel(_ apiModel: MovieAPIModel) -> MovieViewModel {
        return MovieViewModel(
            id: apiModel.id,
            title: apiModel.title,
            overview: apiModel.overview,
            posterPath: apiModel.posterPath,
            releaseDate: apiModel.releaseDate,
            voteAverage: apiModel.voteAverage,
            isFavourite: false
        )
    }
    
    static func viewModelToRealmModel(_ viewModel: MovieViewModel) -> MovieRealmModel {
        let realmModel = MovieRealmModel()
        realmModel.id = viewModel.id
        realmModel.title = viewModel.title
        realmModel.overview = viewModel.overview
        realmModel.posterPath = viewModel.posterPath
        realmModel.releaseDate = viewModel.releaseDate
        realmModel.voteAverage = viewModel.voteAverage
        realmModel.isFavourite = viewModel.isFavourite
        return realmModel
    }
}
