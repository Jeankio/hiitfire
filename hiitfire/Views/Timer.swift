//
//  Timer.swift
//  hiitfire
//
//  Created by Jean Karel on 30/04/23.
//

import SwiftUI

struct TimerView: View {
    @State private var currentTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var currentExerciseIndex = 0
    let exercises = ["Push Ups", "Squats", "Crunches"]
    let exerciseTime = 30.0
    let restTime = 30.0
    
    var body: some View {
        VStack {
            Text(exercises[currentExerciseIndex])
                .font(.title)
            Text("\(Int(exerciseTime - currentTime)) seconds left")
                .font(.headline)
            HStack {
                Button("Start") {
                    startTimer()
                }
                Button("Pause") {
                    pauseTimer()
                }
                Button("Reset") {
                    resetTimer()
                }
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            updateTimer()
        }
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        pauseTimer()
        currentTime = 0
        currentExerciseIndex = 0
    }
    
    func updateTimer() {
        currentTime += 1
        if currentTime >= exerciseTime {
            currentExerciseIndex = (currentExerciseIndex + 1) % exercises.count
            currentTime = 0
        } else if currentTime >= exerciseTime - restTime {
            currentExerciseIndex = (currentExerciseIndex + 1) % exercises.count
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
