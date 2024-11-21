//
//  AddGameScreenView.swift
//  gokubi.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import SwiftUI
import SwiftData

struct AddGameScreenView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var game: GamesModel
    @Binding var isPresented: Bool
    @State private var isNotesSheetPresented: Bool = false
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 14) {
            Form {
                Section {
                    TextField("Game title", text: $game.title)
                    TextField("Developer", text: $game.developer)
                } header: {
                    Text("Basic information")
                }

                Section {
                    TextField("Playtime", value: $game.playtime, formatter: formatter)
                        .keyboardType(.numberPad)
                    TextField("Rating", value: $game.rating, formatter: formatter)
                        .keyboardType(.numberPad)
                } header: {
                    Text("Playtime & rating")
                }

                Section {
                    Button {
                        isNotesSheetPresented.toggle()
                    } label: {
                        HStack {
                            Text("Notes")
                            
                            Spacer()
                            
                            Text(game.notes?.isEmpty ?? true ? "Tap to add notes" : game.notes ?? "")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .sheet(isPresented: $isNotesSheetPresented) {
                        NotesSheetScreenView(notes: Binding(
                            get: { game.notes ?? "" },
                            set: { game.notes = $0.isEmpty ? nil : $0 }
                        ), isNoteSheetPresented: $isNotesSheetPresented)
                    }
                } header: {
                    Text("Notes")
                }

                Section {
                    Picker("Genre", selection: $game.genre) {
                        ForEach(Genres.allCases, id: \.self) { genre in
                            Text(genre.rawValue.capitalized).tag(genre)
                        }
                    }
                    
                    Picker("Platforms", selection: $game.platforms) {
                        ForEach(Platforms.allCases, id: \.self) { platform in
                            Text(platform.rawValue.capitalized).tag(platform)
                        }
                    }
                    
                    Toggle("Completed?", isOn: $game.completed)
                } header: {
                    Text("Genre & Platforms")
                }
                
                ButtonView(
                    label: "Add game",
                    textColor: .white,
                    backgroundColor: .purple,
                    action: addGame
                )
            }
        }
    }
    
    func addGame() {
        let newGame = GamesModel(
            title: game.title,
            developer: game.developer,
            playtime: game.playtime,
            rating: game.rating,
            notes: game.notes,
            completed: game.completed,
            dateAdded: .now,
            genre: game.genre,
            platforms: game.platforms
        )
        modelContext.insert(newGame)
        isPresented = false
    }
}

//#Preview {
//    AddGameScreenView()
//}
