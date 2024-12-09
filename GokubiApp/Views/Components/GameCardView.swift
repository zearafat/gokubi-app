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
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                // Safely unwrap and load the cover image
                if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44) // Adjust frame as needed
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                } else {
                    // Placeholder if image data is unavailable
                    Image("coverartdummy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(game.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .fontDesign(.rounded)
                        
                        Text(game.developer)
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .fontDesign(.rounded)
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
                            label: "On Progress",
                            labelColor: .secondary,
                            backgroundColor: .slate100
                        )
                    }
                }
            }
            
            Divider()
                .padding(.vertical, 16)
            
            HStack(alignment: .center, spacing: 18) {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "clock")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Text("\(game.playtime.formatted(.number.precision(.fractionLength(0)))) hours")
                        .font(.subheadline)
                        .fontDesign(.rounded)
                }
                
                HStack(alignment: .center, spacing: 6) {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                    
                    Text("\(game.rating)/5")
                        .font(.subheadline)
                        .fontDesign(.rounded)
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.gray.opacity(0.2), radius: 0, x: 0, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.slate200, lineWidth: 1)
        )
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
