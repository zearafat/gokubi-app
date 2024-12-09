//
//  CardGameStatsView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 29/11/24.
//

import SwiftUI

struct CardGameStatsView: View {
    var game: GamesModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Gaming Stats")
                .font(.system(size: 18))
                .fontWeight(.bold)
            
            HStack {
                // PLAYTIME
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 0) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "clock.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                
                                Text("Playtime")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.blue)
                            
                            Text("\(game.playtime.formatted(.number.precision(.fractionLength(0)))) hours")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                    }

                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(.slate400, lineWidth: 0.5)
                )
                
                // RATING
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 0) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                
                                Text("Ratings")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.purple)
                            
                            if game.rating == 1 {
                                Text("Bad \(game.rating)/5")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            } else if game.rating == 2 {
                                Text("Mediocre \(game.rating)/5")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            } else if game.rating == 3 {
                                Text("Good \(game.rating)/5")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            } else if game.rating == 4 {
                                Text("Awesome \(game.rating)/5")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            } else if game.rating == 5 {
                                Text("Excellent \(game.rating)/5")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                            }

                        }
                        
                        Spacer()
                    }

                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(.slate400, lineWidth: 0.5)
                )
            }
            
            HStack {
                // GENRE
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 0) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "flag.pattern.checkered")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                
                                Text("Genre")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.green)
                            
                            Text("\(game.genre.rawValue)")
                                .autocapitalization(.words)
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                    }

                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(.slate400, lineWidth: 0.5)
                )
                
                // PLATFORM
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 0) {
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "gamecontroller.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18, height: 18)
                                
                                Text("Platforms")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.red)
                            
                            Text("\(game.platforms.rawValue)")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }

                }
                .padding(16)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(.slate400, lineWidth: 0.5)
                )
            }
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    CardGameStatsView(game: GamesModel(
        title: "Stardew Valley",
        developer: "CorneredApe",
        playtime: 200,
        rating: 5,
        completed: true,
        dateAdded: .now,
        genre: .sandbox,
        platforms: .nintendoSwitch,
        coverImageData: .none,
        pros: [
            "Gorgeous artwork!",
            "Great soundtrack!",
            "Great gameplay!"
        ],
        cons: [
            "Some bugs.",
            "Not very challenging.",
            "Not very fun."
        ]
        )
    )
}
