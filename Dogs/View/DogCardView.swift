//
//  DogCardView.swift
//  Dogs
//
//  Created by Екатерина Яцкевич on 27.06.25.
//


import SwiftUI

struct DogCardView: View {
    let dog: Dog
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            AsyncImage(url: URL(string: dog.image_link)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .clipped()
            } placeholder: {
                ZStack {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 200)
                    ProgressView()
                }
            }
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(dog.name)
                    .font(.system(size: 24))
                    .bold()
                
                Text("Продолжительность жизни: \(Int(dog.min_life_expectancy))–\(Int(dog.max_life_expectancy)) лет")
                    .font(.system(size: 14))
                    .foregroundColor(Color(.systemGray6))
                
                RatingView(value: dog.playfulness, text: "Игривость:")
                RatingView(value: dog.trainability, text: "Обучаемость:")
                RatingView(value: dog.energy, text: "Энергия:")
            }
        }
        .padding()
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .shadow(radius: 1)
        .background(.backgroundGreen)
        .cornerRadius(20)
    }
}