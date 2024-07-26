//
//  LampaTestTaskApp.swift
//  LampaTestTask
//
//  Created by Vitya Mandryk on 25.07.2024.
//

import SwiftUI

@main
struct LampaTestTaskApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        
        // Set the background to clear
        appearance.backgroundColor = UIColor.mainBackgroundColor
        appearance.shadowColor = UIColor.mainBackgroundColor
        
        // Set the title text color
        appearance.titleTextAttributes = [.foregroundColor: UIColor.customAccentOrange]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.customAccentOrange]
        
        // Apply the appearance to the navigation bar
        let navigationBar = UINavigationBar.appearance()
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.barTintColor = nil // Ensure there's no default color
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label(AppText.home, systemImage: AppImages.house)
                    }
                FavoritesView()
                    .tabItem {
                        Label(AppText.favourites, systemImage: AppImages.star)
                    }
            }
            .accentColor(AppColor.accentOrange)
        }
    }
}
