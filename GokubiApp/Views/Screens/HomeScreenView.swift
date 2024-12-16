//
//  HomeScreen.swift
//  GokubiApp.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import SwiftUI
import SwiftData

struct HomeScreenView: View {
    @Query(sort: \GamesModel.dateAdded, order: .reverse) var games: [GamesModel]
    @State private var isPresented: Bool = false
    @State private var selectedFilter: GameStatus = .all
    @Environment(\.modelContext) private var modelContext
    
    enum GameStatus: String, CaseIterable, Identifiable {
        case all = "All"
        case completed = "Completed"
        case onProgress = "On Progress"
        
        var id: String { self.rawValue }
    }
    
    // Filtered games based on selection
    var filteredGames: [GamesModel] {
        switch selectedFilter {
        case .all:
            return games
        case .completed:
            return games.filter { $0.completed == true }
        case .onProgress:
            return games.filter { $0.completed == false }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    ZStack(alignment: .trailing) {
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color.violet300, Color.violet50, Color.white]), startPoint: .top, endPoint: .bottom)
                            )
                            .padding(.top, -160)
                        
                        VStack(alignment: .leading, spacing: 24) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Greetings, weary traveler 🧙‍♂️")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)

                                Text("What game thou seek to master this day?")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secondary)
                            }
                            .fontDesign(.rounded)
 
                            WidgetDashboardView(games: games)
                        }
                        .padding(.bottom, 24)
                        .padding(.top, -16)
                        .padding(.horizontal, 16)
                    }
                    
                    VStack(alignment: .center, spacing: 14) {
                        if filteredGames.isEmpty {
                            Image(systemName: "tray.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .foregroundStyle(.slate400)

                            Text("No Games Found")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.slate400)
                            
                            ButtonView(
                                label: "Add Game",
                                textColor: .white,
                                textSize: 14,
                                backgroundColor: .violet500,
                                dropShadowColor: .violet700,
                                action: {
                                    isPresented = true
                                },
                                disabled: false,
                                hasIcon: false
                            )
                            .padding(.vertical, 14)
                            .padding(.horizontal, 34)
                        }
                        else {
                            HStack {
                                Text("Played games 🎮")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                                
                                Spacer()
                                
                                Picker("Filter", selection: $selectedFilter) {
                                    ForEach(GameStatus.allCases) { status in
                                        Text(status.rawValue).tag(status)
                                    }
                                }
                                .pickerStyle(.automatic)
                            }
                            
                            ForEach(filteredGames) { game in
                                NavigationLink(destination: GameDetailScreenView(game: game)) {
                                    GameCardView(game: game)
                                }
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("LOGO")
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
        .fontDesign(.rounded)
    }
}

//#Preview {
//    HomeScreenView()
//}
