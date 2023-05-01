//
//  CountDownTimerView.swift
//  hiitfire
//
//  Created by Jean Karel on 1/05/23.
//

import SwiftUI

struct CountDownTimerView: View {
    
    @Binding var exercise: HiitTraining
    
    @State private var secondsRemaining = 0
    @State private var timerRunning = false
    // Variable para el ejercicio actual
    var currentExerciseIndex: Int
    
    var body: some View {
        VStack {
            // Para mostrar el nombre del ejercicio actual
            Text(exercise.exercises[currentExerciseIndex].name)
            Text("\(formattedTime)")
            Button(action: {
                startTimer()
            }, label: {
                Text("Start Timer")
            })
            .disabled(timerRunning)
        }
        .navigationTitle("Timer")
        .onAppear {
            secondsRemaining = exercise.duration * 60
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if timerRunning {
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        })
    }
    
    func startTimer() {
        timerRunning = true
    }
    
    func stopTimer() {
        timerRunning = false
    }
    // Hacer que el contador sea minutos con segundos
    var formattedTime: String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}




struct CountDownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownTimerView(exercise: .constant(HiitTraining.emptyExercise), currentExerciseIndex: 0)
    }
}
