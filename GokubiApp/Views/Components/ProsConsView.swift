//
//  ProsConsView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 09/12/24.
//

import SwiftUI

struct ProsConsView: View {
    let game: GamesModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 14) {
                Text("Pros")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
                    .padding(.bottom, 8)
                
                HStack {
                    Image(systemName: "chevron.up.circle.fill")
                        .foregroundStyle(.green)
                    
                    if let gamePros = game.pros[0] {
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
                
                HStack {
                    Image(systemName: "chevron.up.circle.fill")
                        .foregroundStyle(.green)
                    
                    if let gamePros = game.pros[1] {
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
                
                HStack {
                    Image(systemName: "chevron.up.circle.fill")
                        .foregroundStyle(.green)
                    
                    if let gamePros = game.pros[2] {
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 14) {
                Text("Cons")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.secondary)
                    .padding(.bottom, 8)
                
                HStack {
                    Image(systemName: "chevron.down.circle.fill")
                        .foregroundStyle(.red)
                    
                    if let gameCons = game.cons[0] {
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
                
                HStack {
                    Image(systemName: "chevron.down.circle.fill")
                        .foregroundStyle(.red)
                    
                    if let gameCons = game.cons[1] {
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
                
                HStack {
                    Image(systemName: "chevron.down.circle.fill")
                        .foregroundStyle(.red)
                    
                    if let gameCons = game.cons[2] {
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    } else {
                        Text("-")
                    }
                }
                
            }
        }
        .fontDesign(.rounded)
        .padding(24)
        .background(.slate100)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    ProsConsView(
        game: GamesModel(
            title: "Hollow Knight",
            developer: "Cherry Team",
            playtime: 200.0,
            rating: 4,
            completed: true,
            dateAdded: .now,
            genre: .metroidvania,
            platforms: .nintendoSwitch,
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
