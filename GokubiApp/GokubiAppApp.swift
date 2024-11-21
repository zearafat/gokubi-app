//
//  GokubiAppApp.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 10/11/24.
//

import SwiftUI
import SwiftData

@main
struct GokubiAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenView()
        }
        .modelContainer(for: GamesModel.self)
    }
}
