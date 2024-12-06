//
//  ProsConsFormView.swift
//  GokubiApp
//
//  Created by Alzea Arafat on 05/12/24.
//

import SwiftUI

struct ProsConsFormView: View {
    let game: GamesModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            VStack {
                HStack(alignment: .center, spacing: 4) {
                    VStack (alignment: .leading) {
                        Text("✅ Pros")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ForEach(0..<3, id: \.self) { index in
                            TextField("Pro \(index + 1)", text: Binding(
                                get: { game.pros[index] ?? "" },
                                set: { game.pros[index] = $0.isEmpty ? nil : $0 }
                            ))
                            .autocorrectionDisabled(true)
                            .padding()
                            .background(.slate100)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                    }

                    VStack (alignment: .leading) {
                        Text("❌ Cons")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        ForEach(0..<3, id: \.self) { index in
                            TextField("Con \(index + 1)", text: Binding(
                                get: { game.cons[index] ?? "" },
                                set: { game.cons[index] = $0.isEmpty ? nil : $0 }
                            ))
                            .autocorrectionDisabled(true)
                            .padding()
                            .background(.slate100)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        }
                    }
                }
            }
            .fontDesign(.rounded)
        }
    }
}

//#Preview {
//    ProsConsFormView(game: GameModel)
//}
