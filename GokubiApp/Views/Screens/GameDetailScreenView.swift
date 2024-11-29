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
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Gaming Stats")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        HStack {
                            // PLAYTIME
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "clock.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("Playtime")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                }
                                
                                Text("\(game.playtime.formatted(.number.precision(.fractionLength(0)))) hours")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                            .padding(.trailing, 40)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(.slate400, lineWidth: 0.5)
                            )
                            
                            // RATING
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("Rating")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                }
                                
                                Text("\(game.rating) out of 5")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                            .padding(.trailing, 40)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(.slate400, lineWidth: 0.5)
                            )
                        }
                        
                        HStack {
                            // PLAYTIME
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "clock.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("Genre")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                }
                                
                                Text("\(game.genre)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                            .padding(.trailing, 40)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(.slate400, lineWidth: 0.5)
                            )
                            
                            // RATING
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 16, height: 16)
                                    
                                    Text("Platform")
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .fontDesign(.rounded)
                                }
                                
                                Text("\(game.platforms)")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .fontDesign(.rounded)
                            }
                            .padding(.trailing, 40)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14, style: .continuous)
                                    .stroke(.slate400, lineWidth: 0.5)
                            )
                        }
                    }
                }
                .padding(16)
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
