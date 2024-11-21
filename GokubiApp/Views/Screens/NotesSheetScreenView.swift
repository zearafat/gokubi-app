//
//  NotesSheetScreenView.swift
//  gokubi.app
//
//  Created by Alzea Arafat on 07/11/24.
//

import SwiftUI

struct NotesSheetScreenView: View {
    @Binding var notes: String
    @Binding var isNoteSheetPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $notes)
                    .padding()
                    .navigationTitle("Edit notes")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Close") {
                                isNoteSheetPresented = false
                            }
                        }
                    }
            }
        }
    }
}

//#Preview {
//    NotesSheetScreenView()
//}
