//
//  MovieRow.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI

struct MovieRow: View {
    let movie: MovieViewModel
    
    var body: some View {
        ZStack {
            HStack {
                AsyncImage(url: URL(string: "\(AppURLs.baseImageURL)\(movie.posterPath)"))
                    .frame(width: 128, height: 188)
                    .cornerRadius(8)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(movie.title)
                        .font(.custom(RalewayFontNames.bold, size: 14))
                        .lineLimit(2)
                        .foregroundColor(.black)
                    Text(movie.overview)
                        .multilineTextAlignment(.leading)
                        .font(.custom(RalewayFontNames.regular, size: 12))
                        .foregroundColor(AppColor.customDarkGrayColor)
                    Text(movie.releaseDate)
                        .font(.custom(RalewayFontNames.bold, size: 12))
                        .foregroundColor(AppColor.accentOrange)
                }
                Spacer()
            }
            .padding(.vertical, 10)
        }
        .background(.white)
        .cornerRadius(12)
        .padding(10)
    }
}


