//
//  DetailSheet.swift
//  Scrumdinger
//
//  Created by Yves Hurdequint on 14/01/2024.
//

import SwiftUI

struct NewDetailSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var isPresentingEditView: Bool
    @State private var editingScrum: DailyScrum
    
    init(scrum: Binding<DailyScrum>, isPresentingEditView: Binding<Bool>) {
            _scrum = scrum
            _isPresentingEditView = isPresentingEditView
            _editingScrum = State(initialValue: scrum.wrappedValue)
        }
    

    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(editingScrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Confirm") {
                            scrum = editingScrum
                            isPresentingEditView = false
                        }
                    }
                }
        }
        
    }
}

struct NewDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailSheet(
            scrum: .constant(DailyScrum.sampleData[0]),
            isPresentingEditView: .constant(false))
    }
}
