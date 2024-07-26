//
//  AppConstants.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 26.07.2024.
//

import Foundation
import SwiftUI
import UIKit



enum AppUIColors {
    static let mainBackground = UIColor(named: "MainBackgroundColor") ?? UIColor.clear
    static let accentOrange = UIColor(named: "accentOrange") ?? UIColor.orange
}

enum AppColor {
    static let mainBackground = Color("MainBackgroundColor")
    static let accentOrange = Color("accentOrange")
    static let customDarkGrayColor = Color("customDarkGrayColor")
}

enum RalewayFontNames {
    static let regular = "Raleway-Regular"
    static let semiBold = "Raleway-SemiBold"
    static let bold = "Raleway-Bold"
}
enum AppText {
    static let movies = "MOVIES"
    static let topRatedMovies = "Top Rated Movies"
    static let movie = "MOVIE"
    static let description = "Description:"
    static let releaseDatePrefix = "Release: "
    static let movieFullNamePrefix = "Movie full name:"
    static let listIsEmpty = "List is empty :("
    static let ok = "OK"
    static let home = "Home"
    static let favourites = "Favourite"
    static let errorFetchingPopularMovies = "Error fetching popular movies:"
    static let errorObservingRealm = "Error observing Realm:"
}


enum AppURLs {
    static let apiKey = "ed0957c3c3f2acb89d27b394e9612d5e"
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let apiBaseURL = "https://api.themoviedb.org/3"
    static let popularMoviePath = "/movie/popular"
}


enum AppImages {
    static let playImage = "PlayImage"
    static let arrowLeft = "arrowLeft"
    static let starFilled = "star.fill"
    static let star = "star"
    static let house = "house"
}


