//
//  MinutesToCaloriesModel.swift
//  hiitfire
//
//  Created by Jean Karel on 27/04/23.
//

import Foundation

func calculateCaloriesBurned(duration: Int) -> Int {
    let caloriesBurned = Int(Double(duration) * 9.3)
    return caloriesBurned
}
