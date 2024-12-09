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
                
                
                if let gamePros = game.pros[0] {
                    HStack {
                        Image(systemName: "chevron.up.circle.fill")
                            .foregroundStyle(.green)
                        
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
                    }
                }
                
                if let gamePros = game.pros[1] {
                    HStack {
                        Image(systemName: "chevron.up.circle.fill")
                            .foregroundStyle(.green)
                        
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
                    }
                }
                
                if let gamePros = game.pros[2] {
                    HStack {
                        Image(systemName: "chevron.up.circle.fill")
                            .foregroundStyle(.green)
                        
                        Text(gamePros)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
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
                
                if let gameCons = game.cons[0] {
                    HStack {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundStyle(.red)
                        
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
                    }
                }
                
                if let gameCons = game.cons[1] {
                    HStack {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundStyle(.red)
                        
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
                    }
                }
                
                if let gameCons = game.cons[2] {
                    HStack {
                        Image(systemName: "chevron.down.circle.fill")
                            .foregroundStyle(.red)
                        
                        Text(gameCons)
                            .multilineTextAlignment(.leading)
                    }
                } else {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundStyle(.slate200)
                        
                        Text("-")
                            .foregroundStyle(.slate200)
                    }
                }
            }
        }
        .fontDesign(.rounded)
        .padding(16)
        .background(.slate50)
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
