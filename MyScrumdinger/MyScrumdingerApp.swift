//
//  MyScrumdingerApp.swift
//  MyScrumdinger
//
//  Created by 정유진 on 2023/08/01.
//

import SwiftUI

@main
struct MyScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
