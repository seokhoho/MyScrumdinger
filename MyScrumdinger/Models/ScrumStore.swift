//
//  ScrumStore.swift
//  MyScrumdinger
//
//  Created by 정유진 on 2023/08/02.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
    
    @Published var scrums: [DailyScrum] = []
    
    private static func fileURL() throws -> URL {
        
        try FileManager.default.url(for: .documentDirectory,
                                          in: .userDomainMask,
                                          appropriateFor: nil,
                                          create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            //스크럼 데이터를 인코딩한다
            let data = try JSONEncoder().encode(scrums)
            //fileURL을 상수로 할당
            let outfile = try Self.fileURL()
            //인코딩한 데이터를 파일에 쓴다
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
    
}
