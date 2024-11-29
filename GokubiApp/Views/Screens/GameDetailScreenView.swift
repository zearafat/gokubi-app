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
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack {
                    // Featured Image
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: .infinity , height: 140)
                            .clipShape(Rectangle())
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity , height: 140)
                            .clipShape(Rectangle())
                    }
                    
                    // Cover Art
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 130)
                            .padding(.leading, -180)
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 130)
                            .padding(.leading, -180)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
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
                .padding(24)
            }
        }
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
