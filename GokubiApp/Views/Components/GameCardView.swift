//
//  GameCardView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/11/24.
//

import SwiftUI

struct GameCardView: View {
    var game: GamesModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                // Safely unwrap and load the cover image
                if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44) // Adjust frame as needed
                        .cornerRadius(8)
                } else {
                    // Placeholder if image data is unavailable
                    Image("coverartdummy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .foregroundColor(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                }
                
                VStack(alignment: .leading) {
                    Text(game.title)
                        .font(.headline)
                        .fontDesign(.rounded)
                    
                    Text(game.developer)
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                        .fontDesign(.rounded)
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
                
                HStack(alignment: .center, spacing: 6) {
                    if game.completed {
                        Text("Completed")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .font(.subheadline)
                            .fontDesign(.rounded)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    } else {
                        Text("In Progress")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontDesign(.rounded)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
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
            coverImageData: nil
        )
    )
}
