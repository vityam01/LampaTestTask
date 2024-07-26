//
//  MovieDetailView.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @State private var showingAlert = false
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            ScrollView {
                ZStack {
                    AsyncImage(url: URL(string: "\(AppURLs.baseImageURL)\(viewModel.movie.posterPath)")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(25)
                            .frame(height: 200)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(height: 200)
                    }
                    .cornerRadius(25)
                    .edgesIgnoringSafeArea(.top)
                    
                    VStack {
                        Spacer()
                        Button {
                            showAlert()
                        } label: {
                            Image(AppImages.playImage)
                                .frame(width: 64, height: 64)
                        }
                        .padding(.bottom, 33)
                        
                        HStack {
                            Text(viewModel.movie.title)
                                .font(.custom(RalewayFontNames.bold, size: 16))
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack {
                                Text("\(String(format: "%.1f", viewModel.movie.voteAverage))")
                                    .foregroundColor(.white)
                                    .font(.custom(RalewayFontNames.semiBold, size: 12))
                                    .multilineTextAlignment(.trailing)
                                
                                Button(action: {
                                    viewModel.saveToFavorites()
                                }) {
                                    Image(systemName: viewModel.isFavorite ? AppImages.starFilled : AppImages.star)
                                        .frame(width: 16, height: 16)
                                        .padding()
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        .padding(.horizontal, 25)
                    }
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                
                VStack(alignment: .leading) {
                    Text(AppText.description)
                        .foregroundColor(.black)
                        .font(.custom(RalewayFontNames.semiBold, size: 16))
                        .padding(.bottom, 2)
                    
                    Text(viewModel.movie.overview)
                        .multilineTextAlignment(.leading)
                        .font(.custom(RalewayFontNames.regular, size: 14))
                        .foregroundColor(AppColor.customDarkGrayColor)
                    
                    Text("\(AppText.releaseDatePrefix) \(viewModel.movie.releaseDate)")
                        .multilineTextAlignment(.leading)
                        .font(.custom(RalewayFontNames.semiBold, size: 14))
                        .foregroundColor(AppColor.accentOrange)
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(AppImages.arrowLeft)
                        .frame(width: 20, height: 20)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text(AppText.movie)
                    .font(.headline)
                    .foregroundColor(AppColor.accentOrange)
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("\(AppText.movieFullNamePrefix) \(viewModel.movie.title)"),
                  dismissButton: .default(Text(AppText.ok)))
        }
        .background(AppColor.mainBackground)
    }
    
    private func showAlert() {
        showingAlert = true
    }
}
