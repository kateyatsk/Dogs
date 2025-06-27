//
//  Dog.swift
//  Dogs
//
//  Created by Екатерина Яцкевич on 27.06.25.
//

struct Dog: Decodable {
    let image_link: String
    let min_life_expectancy: Double
    let max_life_expectancy: Double
    let playfulness: Int
    let trainability: Int
    let energy: Int
    let name: String
}
