//
//  GameDetailView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 13/11/24.
//

import SwiftUI

struct GameDetailScreenView: View {
    var game: GamesModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var showDeleteConfirmation: Bool = false
    @State private var isPresented: Bool = false
    @State private var illustrationOffset: Double = 0.0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ZStack {
                    // Featured Image
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .clipShape(Rectangle())
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .clipShape(Rectangle())
                    }
                    
                    // Cover Art
                    if let imageData = game.coverImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 200)
                            .padding(.leading, -180)
                            .offset(y: illustrationOffset)
                            .onAppear {
                                withAnimation(.bouncy(duration: 0.4)) {
                                    illustrationOffset = -20.0
                                } completion: {
                                    withAnimation(.bouncy(duration: 0.4)) {
                                        illustrationOffset = 0.0
                                    }
                                }
                            }
                    } else {
                        // Placeholder if image data is unavailable
                        Image("coverartdummy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 84, height: 84)
                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white, lineWidth: 4)
                            )
                            .shadow(color: Color.black.opacity(0.12) ,radius: 10, x: 0, y: 10)
                            .padding(.top, 200)
                            .padding(.leading, -180)
                    }
                }
                .padding(.top, -80)
                
                VStack(alignment: .leading, spacing: 34) {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(game.title)
                                .lineLimit(1)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                            
                            Spacer()
                            
                            if game.completed {
                                BadgeView(
                                    icon: "medal.fill",
                                    label: "Completed",
                                    labelColor: .white,
                                    backgroundColor: .green
                                )
                            } else {
                                BadgeView(
                                    label: "On Progress",
                                    labelColor: .secondary,
                                    backgroundColor: .slate200
                                )
                            }
                        }
                        
                        Text("By \(game.developer)")
                            .foregroundStyle(.secondary)
                            .fontDesign(.rounded)
                    }
                    
                    CardGameStatsView(game: game)
                    
                    ProsConsView(game: game)
                    
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Notes and Reviews ✨")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                        
                        if let notes = game.notes, !notes.isEmpty {
                            Text(notes)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .background(.slate50)
                                .frame(maxWidth: .infinity)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                                
                        } else {
                            Text("No notes yet 🥺") // Should be empty state illustration here
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.leading)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.slate50)
                                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                        
                        Button(role: .destructive) {
                            showDeleteConfirmation = true
                        } label: {
                            Text("Delete Game")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                        }
                        .buttonStyle(.borderless)
                        .tint(.red)
                        .confirmationDialog("Are you sure want to delete this game entry?", isPresented: $showDeleteConfirmation, titleVisibility: .visible) {
                            Button("Delete", role: .destructive) {
                                deleteGames()
                            }
                        }
                    }
                }
                .padding(16)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(game.title)")
                        .lineLimit(1)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Edit")
                            .fontWeight(.bold)
                    }
                    .sheet(isPresented: $isPresented) {
                        NavigationStack {
                            VStack {
                                EditGameScreenView(game: game, isPresented: $isPresented)
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
                            .navigationTitle("Edit Game")
                            .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                }
            }
            .fontDesign(.rounded)
        }
        .fontDesign(.rounded)
    }
    
    func deleteGames() {
        let game = game
        modelContext.delete(game)
        try? modelContext.save()
        dismiss()
    }
}

//#Preview {
//    GameDetailScreenView(
//        game: GamesModel(
//            title: "Hollow Knight",
//            developer: "Team Cherry",
//            playtime: 120,
//            rating: 5,
//            notes: "",
//            completed: true,
//            dateAdded: .now,
//            genre: .action,
//            platforms: .nintendoSwitch,
//            coverImageData: .none,
//            pros: [
//                "Gorgeous artwork!",
//                "Great soundtrack!",
//                "Great gameplay!"
//            ],
//            cons: [
//                "Some bugs.",
//                "Not very challenging.",
//                "Not very fun."
//            ]
//        )
//    )
//}
