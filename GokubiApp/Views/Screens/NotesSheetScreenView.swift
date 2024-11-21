//
//  NotesSheetScreenView.swift
//  GokubiApp.app
//
//  Created by Alzea Arafat on 07/11/24.
//

import SwiftUI

struct NotesSheetScreenView: View {
    @Binding var notes: String
    @Binding var isNoteSheetPresented: Bool
    
    // Temporary states to store original Notes value
    @State private var tempNotes: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                TextEditor(text: $tempNotes)
                    .autocorrectionDisabled(true)
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button {
                                // Revert changes and close the sheet
                                tempNotes = notes
                                isNoteSheetPresented = false
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.gray)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Edit notes")
                                .font(.headline)
                                .fontDesign(.rounded)
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                // Save changes and close the sheet
                                notes = tempNotes
                                isNoteSheetPresented = false
                            }
                            .disabled(tempNotes.isEmpty) // Disable if tempNotes is empty
                        }
                    }
            }
            .onAppear() {
                // Innitialize tempNotes with the current Notes value when sheet appears
                tempNotes = notes
            }
        }
    }
}

//#Preview {
//    NotesSheetScreenView()
//}
