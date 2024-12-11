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
    @Environment(\.modelContext) private var modelContext
    
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
                        
                        Image("mascot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding(.top, -200)
                        
                        VStack(alignment: .leading, spacing: 24) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Greetings, weary traveler 🧙‍♂️")
                                    .font(.system(size: 16))
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
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Played games 🎮")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                        
                        ForEach(games) { game in
                            NavigationLink(destination: GameDetailScreenView(game: game)) {
                                GameCardView(game: game)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
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
    }
}

//#Preview {
//    HomeScreenView()
//}
