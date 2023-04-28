//
//  hiitfireApp.swift
//  hiitfire
//
//  Created by Jean Karel on 25/04/23.
//

import SwiftUI

@main
struct hiitfireApp: App {
    @State private var exercises = HiitTraining.backTraining
    
    var body: some Scene {
        WindowGroup {
            ExerciseView(exercises: $exercises)
        }
    }
}
