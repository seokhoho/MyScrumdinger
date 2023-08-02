//
//  TrailingIconLabelStyle.swift
//  MyScrumdinger
//
//  Created by 정유진 on 2023/08/01.
//

import SwiftUI


struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            configuration.title
            configuration.icon
            
        }
        
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
