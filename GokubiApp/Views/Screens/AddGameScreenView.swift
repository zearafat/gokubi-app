//
//  AddGameScreenView.swift
//  GokubiApp.app
//
//  Created by Alzea Arafat on 03/11/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct AddGameScreenView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var game: GamesModel
    @Binding var isPresented: Bool
    @State private var isNotesSheetPresented: Bool = false
    @State private var selectedImage: PhotosPickerItem? = nil
    
    var body: some View {
        VStack(spacing: 14) {
            Form {
                PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                    Label("Select cover art", systemImage: "photo")
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .fontWeight(.black)
                        .fontDesign(.rounded)
                        .padding(12)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .shadow(color: .red.opacity(100), radius: 0, x: 0, y: 7)
                        .padding(.bottom, 6)
                }
                
                if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(14)
                        
                        if selectedImage != nil {
                            Button(role: .destructive) {
                                withAnimation {
                                    selectedImage = nil
                                    game.coverImageData = nil
                                }
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundStyle(.white)
                            }
                            .padding(14)
                        }
                    }
                }
                
                Section {
                    TextField("Game Title", text: $game.title)
                        .autocorrectionDisabled(true)
                    TextField("Developer", text: $game.developer)
                        .autocorrectionDisabled(true)
                } header: {
                    Text("Basic information")
                }
                .fontDesign(.rounded)
                
                Section {
                    HStack {
                        Image("masks")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Picker("Genre", selection: $game.genre) {
                            ForEach(Genres.allCases, id: \.self) { genre in
                                Text(genre.rawValue.capitalized).tag(genre)
                            }
                        }
                    }
                    
                    HStack {
                        Image("platforms")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Picker("Platforms", selection: $game.platforms) {
                            ForEach(Platforms.allCases, id: \.self) { platform in
                                Text(platform.rawValue.capitalized).tag(platform)
                            }
                        }
                        
                    }
                    
                    HStack {
                        Image("check")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Toggle("Completed?", isOn: $game.completed)
                    }
                    
                } header: {
                    Text("Genre & Platforms")
                }
                .fontDesign(.rounded)

                Section {
                    PlaytimeSliderView(playtime: $game.playtime)
                    RatingView(rating: $game.rating)
                } header: {
                    Text("Playtime & Rating")
                }
                .fontDesign(.rounded)

                Section {
                    Button {
                        isNotesSheetPresented.toggle()
                    } label: {
                        HStack {
                            Text(game.notes?.isEmpty ?? true ? "Tap to add notes" : game.notes ?? "")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.trailing)
                                .autocorrectionDisabled(true)
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
                .fontDesign(.rounded)
            }
            .task(id: selectedImage) {
                if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                    game.coverImageData = data
                }
            }
            
            ButtonView(
                label: "Add Game",
                textColor: .white,
                backgroundColor: .violet600,
                dropShadowColor: .violet800,
                action: addGame,
                disabled: game.title.isEmpty || game.developer.isEmpty
            )
            .padding(.horizontal, 16)
        }
    }
    
    func addGame() {
        game.coverImageData = game.coverImageData
        
        if let imageData = game.coverImageData {
            print("DEBUG: Cover image data size: \(imageData.count) bytes")
        }
        
        let newGame = GamesModel(
            title: game.title,
            developer: game.developer,
            playtime: game.playtime,
            rating: game.rating,
            notes: game.notes,
            completed: game.completed,
            dateAdded: .now,
            genre: game.genre,
            platforms: game.platforms,
            coverImageData: game.coverImageData
        )
        modelContext.insert(newGame)
        try? modelContext.save()
        isPresented = false
    }
}

//#Preview {
//    AddGameScreenView()
//}
