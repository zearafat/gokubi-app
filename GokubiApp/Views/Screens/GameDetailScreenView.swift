//
//  GameDetailView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/11/24.
//

import SwiftUI

struct GameDetailScreenView: View {
    let game: GamesModel
    
    var body: some View {
        Text(game.title)
    }
}

#Preview {
    GameDetailScreenView(
        game: GamesModel(
            title: "Hollow Knight",
            developer: "Team Cherry",
            playtime: 120,
            rating: 5,
            notes: "",
            completed: true,
            dateAdded: .now,
            genre: .action,
            platforms: .mobile,
            coverImageData: .none
        )
    )
}
