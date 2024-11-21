//
//  HomeScreen.swift
//  gokubi.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @Query var games: [GamesModel]
    @State private var isPresented: Bool = false
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(games) { game in
                    Text(game.title)
                }
            }
            .navigationTitle("Gokubi")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("LOGO")
                        
                        Spacer()
                        
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isPresented) {
                            VStack {
                                Text("Add Game")
                                    .fontDesign(.rounded)
                                
                                AddGameScreenView(
                                    game: GamesModel(
                                        title: "",
                                        developer: "",
                                        playtime: 0,
                                        rating: 0,
                                        notes: "",
                                        completed: false,
                                        dateAdded: .now,
                                        genre: .action,
                                        platforms: .pc
                                    ),
                                    isPresented: $isPresented
                                )
                                .presentationDetents([.large])
                                .presentationCornerRadius(18)
                                .presentationDragIndicator(.visible)
                            }
                            .padding(.top, 24)
                            .background(.slate50)
                        }
                    }
                }
            }
        }
    }
    
    func deleteGames(at offsets: IndexSet) {
        for index in offsets {
            let game = games[index]
            modelContext.delete(game)
        }
    }
}

#Preview {
    HomeScreenView()
}
