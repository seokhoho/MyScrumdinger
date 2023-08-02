//
//  NewScrumSheet.swift
//  MyScrumdinger
//
//  Created by 정유진 on 2023/08/02.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isPresentingNewScrumView = false
                        } label: {
                            Text("Dismiss")
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            scrums.append(newScrum)
                            isPresentingNewScrumView = false
                        } label: {
                            Text("Add")
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData),  isPresentingNewScrumView: .constant(true))
    }
}
