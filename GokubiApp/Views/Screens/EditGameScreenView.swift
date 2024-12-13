//
//  EditGameScreenView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 11/12/24.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditGameScreenView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var game: GamesModel
    @Binding var isPresented: Bool
    @State private var isNotesSheetPresented: Bool = false
    @State private var selectedImage: PhotosPickerItem? = nil
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                VStack(spacing: 8) {
                    PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                        Label("Select cover art", systemImage: "photo")
                            .font(.system(size: 16))
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
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Basic information")
                        .font(.headline)
                        .padding(.bottom, 8)
                        .fontDesign(.rounded)
                    
                    FormView(
                        placeholderText: "Game Title",
                        bindingText: $game.title,
                        backgroundColor: .slate100
                    )
                    
                    FormView(
                        placeholderText: "Developer",
                        bindingText: $game.developer,
                        backgroundColor: .slate100
                    )
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Genre and Platform")
                        .font(.headline)
                        .padding(.bottom, 8)
                        .fontDesign(.rounded)
                    
                    HStack {
                        Image("masks")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("Genre")
                        
                        Spacer()
                        
                        Picker("Genre", selection: $game.genre) {
                            ForEach(Genres.allCases, id: \.self) { genre in
                                Text(genre.rawValue.capitalized).tag(genre)
                            }
                        }
                    }
                    .padding(12)
                    .background(.slate100)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    HStack {
                        Image("platforms")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Text("Platform")
                        
                        Spacer()
                        
                        Picker("Platforms", selection: $game.platforms) {
                            ForEach(Platforms.allCases, id: \.self) { platform in
                                Text(platform.rawValue.capitalized).tag(platform)
                            }
                        }
                    }
                    .padding(12)
                    .background(.slate100)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    HStack {
                        Image("check")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        Spacer()
                        
                        Toggle("Completed?", isOn: $game.completed)
                    }
                    .padding(12)
                    .background(.slate100)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    PlaytimeSliderView(playtime: $game.playtime)
                    
                    Divider()
                    
                    RatingView(rating: $game.rating)
                }
                .padding(12)
                .background(.slate100)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                
                ProsConsFormView(game: game)
                
                VStack(alignment: .leading, spacing: 8) {
                    Button {
                        isNotesSheetPresented.toggle()
                    } label: {
                        HStack(spacing: 8) {
                            Image(game.notes?.isEmpty ?? true ? "note" : game.notes ?? "")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                            
                            Text(game.notes?.isEmpty ?? true ? "Tap to add notes" : game.notes ?? "")
                                .padding(.vertical, 16)
                                .foregroundStyle(.black)
                                .autocorrectionDisabled(true)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(maxWidth: .infinity)
                        .background(.slate50)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    }
                    .sheet(isPresented: $isNotesSheetPresented) {
                        NotesSheetScreenView(notes: Binding(
                            get: { game.notes ?? "" },
                            set: { game.notes = $0.isEmpty ? nil : $0 }
                        ), isNoteSheetPresented: $isNotesSheetPresented)
                    }
                }
            }
        }
        .fontDesign(.rounded)
        .padding()
        .task(id: selectedImage) {
            if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                game.coverImageData = data
            }
        }
        
        ButtonView(
            label: "Save Game",
            textColor: .white,
            textSize: 16,
            backgroundColor: .violet600,
            dropShadowColor: .violet800,
            action: editGame,
            disabled: game.title.isEmpty || game.developer.isEmpty
        )
        .padding(.horizontal, 16)
    }
    
    private func editGame() {
        withAnimation {
            game.coverImageData = game.coverImageData
            
            try? modelContext.save()
            isPresented = false
        }
    }
}

//#Preview {
//    EditGameScreenView()
//}
