//
//  SearchScreenView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 18/12/24.
//

import SwiftUI
import SwiftData

struct SearchScreenView: View {
    @Query(sort: \GamesModel.dateAdded, order: .reverse) var games: [GamesModel]
    @State private var searchText: String = ""
    @State private var isSearchSheetPresented: Bool = false
    @Binding var navigateToDetail: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                
                ForEach(games) { game in
                    NavigationLink(destination: GameDetailScreenView(game: game)) {
                        GameCardView(game: game)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isSearchSheetPresented.toggle()
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
    }
}

//#Preview {
//    SearchScreenView()
//}
