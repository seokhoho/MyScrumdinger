//
//  ScrumsView.swift
//  MyScrumdinger
//
//  Created by 정유진 on 2023/08/01.
//

import SwiftUI

struct ScrumsView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)

                }
                .listRowBackground(scrum.theme.mainColor)
                
//                NavigationLink {
//                    Text(scrum.title)
//                } label: {
//                    CardView(scrum: scrum)
//                }
//                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
