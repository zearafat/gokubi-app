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
    @State private var isSearchSheetPresented: Bool = false
    @State private var selectedFilter: GameStatus = .all
    @State private var searchText: String = ""
    @State private var navigateToGameDetail: Bool = false
    @State private var selectedGame: GamesModel? = nil
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    enum GameStatus: String, CaseIterable, Identifiable {
        case all = "All"
        case completed = "Completed"
        case onProgress = "On Progress"
        
        var id: String { self.rawValue }
    }
    
    var isGameListEmpy: Bool {
        games.isEmpty
    }
    
    // Filtered games based on selection
    var filteredGames: [GamesModel] {
        let filteredByStatus: [GamesModel]
        
        switch selectedFilter {
        case .all:
            filteredByStatus = games
        case .completed:
            filteredByStatus = games.filter { $0.completed }
        case .onProgress:
            filteredByStatus = games.filter { !$0.completed }
        }
        
        if searchText.isEmpty {
            return filteredByStatus
        } else {
            return filteredByStatus.filter { $0.title.localizedCaseInsensitiveContains(searchText)}
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
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Greetings, weary traveler 🧙‍♂️")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)

                                Text("What game thou seek to master this day?")
                                    .font(.system(size: 16))
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
                        if isGameListEmpy {
                            // First Timer State (No games exist at all)
                            VStack {
                                Image(systemName: "tray.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .foregroundStyle(.slate400)

                                Text("No Games Found")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.slate400)
                                    .padding(.vertical, 8)
                                
                                Text("Add a new game to start tracking your progress!")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 16)
                                
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
                            }
                            .padding(24)
                        } else {
                            VStack {
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
                                .padding(.bottom, 14)
                                .padding(.horizontal, 16)

                                if filteredGames.isEmpty {
                                    // Filter State (Games exist, but filter returns nothing)
                                    VStack(spacing: 14) {
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .foregroundStyle(.secondary)
                                        
                                        Text("No Results Found")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.secondary)
                                        
                                        Text("Try changing your filter criteria.")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 40)
                                    }
                                    .padding(.top, 100)
                                } else {
                                    // Show Filtered Results
                                    ForEach(filteredGames) { game in
                                        NavigationLink(destination: GameDetailScreenView(game: game)) {
                                            GameCardView(game: game)
                                        }
                                    }
                                    .padding(16)
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
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isSearchSheetPresented.toggle()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.violet50)
                            .foregroundStyle(.violet700)
                            .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
                    }
                    .sheet(isPresented: $isSearchSheetPresented) {
                        NavigationStack {
                            ScrollView(showsIndicators: false) {
                                VStack(alignment: .center, spacing: 24) {
                                    HStack(alignment: .top) {
                                        Image(systemName: "magnifyingglass")
                                            .resizable()
                                            .foregroundStyle(.slate500)
                                            .frame(width: 24, height: 24)
                                        TextField("Search games...", text: $searchText)
                                    }
                                    .padding()
                                    .background(.slate100)
                                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                    .shadow(color: .slate200, radius: 0, x: 0, y: 4)
                                    .padding(.bottom, 34)
                                    .autocorrectionDisabled(true)
                                    
                                    ForEach(games.filter { $0.title.localizedCaseInsensitiveContains(searchText) }) { game in
                                        Button {
                                            // Close sheet and navigate to game detail
                                            selectedGame = game
                                            isSearchSheetPresented = false
                                            navigateToGameDetail = true
                                        } label: {
                                            GameCardView(game: game)
                                        }
                                    }
                                }
                                .toolbar {
                                    ToolbarItem(placement: .cancellationAction) {
                                        Button {
                                            isSearchSheetPresented = false
                                        } label: {
                                            Image(systemName: "xmark")
                                                .foregroundStyle(.gray)
                                        }
                                    }
                                }
                                .padding()
                                .navigationTitle("Search Game")
                                .navigationBarTitleDisplayMode(.inline)
                            }
                            Spacer()
                        }
                    }

                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(.violet50)
                            .foregroundStyle(.violet700)
                            .clipShape(RoundedRectangle(cornerRadius: 100, style: .continuous))
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
            .navigationDestination(isPresented: $navigateToGameDetail) {
                if let game = selectedGame {
                    GameDetailScreenView(game: game)
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
