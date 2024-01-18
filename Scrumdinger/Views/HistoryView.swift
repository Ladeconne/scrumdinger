//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Yves Hurdequint on 16/01/2024.
//

import SwiftUI


struct HistoryView: View {
    let history: History


    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
    History(attendees: [
        DailyScrum.Attendee(name: "Jon"),
        DailyScrum.Attendee(name: "June"),
        DailyScrum.Attendee(name: "Jin"),
        ],
            transcript: "Salut, on va super bien, on est super content"
            
    )
    
    }
    static var previews: some View {
        HistoryView(history: history)
    }
}
