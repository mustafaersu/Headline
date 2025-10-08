//
//  HeadlineApp.swift
//  Headline
//
//  Created by Mustafa Ersu on 28.09.2025.
//

import SwiftUI

@main
struct HeadlineApp: App {
    init() {
        let appearance = UISegmentedControl.appearance()
        
            appearance.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
            appearance.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
            appearance.selectedSegmentTintColor = .white
        }
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
