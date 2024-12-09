//
//  WidgetDashboardView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 26/11/24.
//

import SwiftUI

struct WidgetDashboardView: View {
    var games: [GamesModel]
    
    var totalHoursPlayed: Double {
        games.reduce(0) { $0 + $1.playtime }
    }
    
    var totalCompletedGames: Int {
        games.filter { $0.completed }.count
    }
    
    var mostPlayedGenre: Genres? {
        let genrePlayTime = games.reduce(into: [Genres: Double]()) { result, game in
            result[game.genre, default: 0] += game.playtime
        }
        return genrePlayTime.max(by: { $0.value < $1.value })?.key
    }
    
    var mostPlayedGame: GamesModel? {
        games.max(by: { $0.playtime < $1.playtime })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Total Hours Playing: \(Int(totalHoursPlayed)) hours")
                .font(.headline)
            
            Text("Total Completed Games: \(totalCompletedGames)")
                .font(.headline)

            if let genre = mostPlayedGenre {
                Text("Most Played Genre: \(genre.rawValue)")
                    .font(.headline)
            }

            if let game = mostPlayedGame {
                Text("Most Played Game: \(game.title) (\(Int(game.playtime)) hours)")
                    .font(.headline)
            }
        }
        .padding()
    }
}

#Preview {
    WidgetDashboardView(games: [])
}
