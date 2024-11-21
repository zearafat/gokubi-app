//
//  HomeScreen.swift
//  GokubiApp.app
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
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    ForEach(games) { game in
                        GameCardView(game: game)
                            .padding(.horizontal, 16)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("LOGO")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $isPresented) {
                            NavigationStack {
                                VStack {
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
                                            platforms: .pc,
                                            coverImageData: nil
                                        ),
                                        isPresented: $isPresented
                                    )
                                    .scrollIndicators(.hidden)
                                }
                                .toolbar {
                                    ToolbarItem(placement: .cancellationAction) {
                                        Button {
                                            isPresented.toggle()
                                        } label: {
                                            Image(systemName: "xmark")
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                }
                                .navigationTitle("Add Game")
                                .navigationBarTitleDisplayMode(.inline)
                            }
                        }
                        .presentationDetents([.large])
                        .presentationCornerRadius(18)
                        .presentationDragIndicator(.visible)
                    }
                }
            }
            .background(.slate50)
        }
    }
    
    func deleteGames(at offsets: IndexSet) {
        for index in offsets {
            let game = games[index]
            modelContext.delete(game)
        }
    }
}

//#Preview {
//    HomeScreenView()
//}
