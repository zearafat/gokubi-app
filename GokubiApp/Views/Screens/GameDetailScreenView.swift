//
//  GameDetailView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/11/24.
//

import SwiftUI

struct GameDetailScreenView: View {
    var game: GamesModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack {
                    // Featured Image
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 160)
                            .clipShape(Rectangle())
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 160)
                            .clipShape(Rectangle())
                    }
                    
                    // Cover Art
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 100)
                            .padding(.leading, -180)
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 100)
                            .padding(.leading, -180)
                    }
                }
                
                VStack(alignment: .leading, spacing: 34) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(game.title)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                            
                            Spacer()
                            
                            if game.completed {
                                BadgeView(
                                    icon: "medal.fill",
                                    label: "Completed",
                                    labelColor: .white,
                                    backgroundColor: .green
                                )
                            } else {
                                BadgeView(
                                    label: "On Progress",
                                    labelColor: .secondary,
                                    backgroundColor: .slate200
                                )
                            }
                        }
                        
                        Text("By \(game.developer)")
                            .foregroundStyle(.secondary)
                            .fontDesign(.rounded)
                    }
                    
                    CardGameStatsView(game: game)
                    
                    VStack(alignment: .leading) {
                        Text("Notes and Reviews")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.bottom, 14)
                        
                        if let notes = game.notes, !notes.isEmpty {
                            Text(notes)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .background(.slate50)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                
                        } else {
                            Text("No notes yet 🥺") // Should be illustration here
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.slate50)
                            
                            
                        }
                    }
                }
                .padding(16)
            }
        }
        .fontDesign(.rounded)
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
            platforms: .nintendoSwitch,
            coverImageData: .none
        )
    )
}
