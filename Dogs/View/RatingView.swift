//
//  RatingView.swift
//  Dogs
//
//  Created by Екатерина Яцкевич on 27.06.25.
//


import SwiftUI

struct RatingView: View {
    let value: Int
    let text: String
    let max: Int = 5
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 14, weight: .bold))
            HStack(spacing: 4) {
                ForEach(0..<max, id: \.self) { index in
                    Image(systemName: index < value ? "star.fill" : "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}