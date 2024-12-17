//
//  WidgetDashboardView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 26/11/24.
//

import SwiftUI

struct WidgetDashboardView: View {
    var games: [GamesModel]
    
    // Total Hours Played
    var totalHoursPlayed: Double {
        games.reduce(0) { $0 + $1.playtime }
    }
    
    // Total Completed Games
    var totalCompletedGames: Int {
        games.filter { $0.completed }.count
    }
    
    // Most Played Genre
    var mostPlayedGenre: Genres? {
        let genrePlayTime = games.reduce(into: [Genres: Double]()) { result, game in
            result[game.genre, default: 0] += game.playtime
        }
        return genrePlayTime.max(by: { $0.value < $1.value })?.key
    }
    
    // Most Played Game
    var mostPlayedGame: GamesModel? {
        games.max(by: { $0.playtime < $1.playtime })
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center, spacing: 14) {
                HStack(spacing: 14) {
                    Image("timeilus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total hours playing:")
                            .font(.system(size: 12))
                            .foregroundStyle(.slate400)
                        
                        Text("\(Int(totalHoursPlayed)) hours")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                }
                
                Divider()
                
                HStack(spacing: 14) {
                    Image("sword")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Most played genre")
                            .font(.system(size: 12))
                            .foregroundStyle(.slate400)
                        
                        if let genre = mostPlayedGenre {
                            Text("\(genre.rawValue)")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        } else {
                            Text("-")
                                .foregroundStyle(.slate400)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            
            Divider()
            
            HStack(alignment: .center, spacing: 14) {
                Image("podium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Most Played Game: ")
                        .font(.system(size: 12))
                        .foregroundStyle(.slate400)
                    
                    if let game = mostPlayedGame {
                        Text("\(game.title) (\(Int(game.playtime)) hours)")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    } else {
                        Text("-")
                            .foregroundStyle(.slate400)
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .fontDesign(.rounded)
        .padding()
        .background(.slate50)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.gray.opacity(0.2), radius: 0, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.slate200, lineWidth: 1)
        )
    }
}

//#Preview {
//    WidgetDashboardView(games: [])
//}
