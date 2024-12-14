//
//  GameCardView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/11/24.
//

import SwiftUI

struct GameCardView: View {
    let game: GamesModel
    
    var body: some View {
        ZStack {
            // Safely unwrap and load the cover image
            if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(.top, -100)
            } else {
                // Placeholder if image data is unavailable
                Image("coverartdummy")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .padding(.top, -100)
            }
            
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 16) {
                    // Safely unwrap and load the cover image
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44, height: 44)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 44, height: 44)
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(game.title)
                                .lineLimit(1)
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            
                            Text("By \(game.developer)")
                                .lineLimit(1)
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        if game.completed {
                            BadgeView(
                                icon: "medal.fill",
                                label: "Completed",
                                labelColor: .green700,
                                backgroundColor: .green100
                            )
                        } else {
                            BadgeView(
                                label: "In Progress",
                                labelColor: .amber700,
                                backgroundColor: .amber100
                            )
                        }
                    }
                }
                
                HStack(alignment: .center, spacing: 7) {
                    TagChipView(
                        icon: "platforms",
                        label: "\(game.playtime.formatted(.number.precision(.fractionLength(0)))) Hours"
                    )
                    
                    if game.rating == 1 {
                        TagChipView(
                            icon: "platforms",
                            label: "Bad \(game.rating)/5"
                        )
                    } else if game.rating == 2 {
                        TagChipView(
                            icon: "platforms",
                            label: "Mediocre \(game.rating)/5"
                        )
                    } else if game.rating == 3 {
                        TagChipView(
                            icon: "platforms",
                            label: "Good \(game.rating)/5"
                        )
                    } else if game.rating == 4 {
                        TagChipView(
                            icon: "platforms",
                            label: "Awesome \(game.rating)/5"
                        )
                    } else if game.rating == 5 {
                        TagChipView(
                            icon: "platforms",
                            label: "Excellent \(game.rating)/5"
                        )
                    }
                    
                    TagChipView(
                        icon: "platforms",
                        label: "\(game.genre.rawValue)"
                    )
                }
            }
            .fontDesign(.rounded)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color.gray.opacity(0.2), radius: 0, x: 0, y: 5)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: -5)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.slate200, lineWidth: 1)
            )
        }
        .padding(.vertical, 24)
    }
}

#Preview {
    GameCardView(
        game: GamesModel(
            title: "Stardew Valley",
            developer: "ConcernedApe",
            playtime: 200,
            rating: 5,
            notes: "Lorem ipsum dolor sit amet",
            completed: true,
            dateAdded: .now,
            genre: .simulation,
            platforms: .pc,
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
