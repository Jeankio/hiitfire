//
//  CountDownTimerView.swift
//  hiitfire
//
//  Created by Jean Karel on 1/05/23.
//

import SwiftUI

struct CountDownTimerView: View {
    
    @Binding var exercise: HiitTraining
    // Variable para el ejercicio actual
    @State var currentExerciseIndex: Int
    
    @State private var secondsRemaining = 0
    @State private var timerRunning = false
    // Nuevo estado para cambiar el nombre cada minuto
    @State private var currentExerciseName = ""
    
    
    var body: some View {
        VStack {
            // Para mostrar el nombre del ejercicio actual
            Text(currentExerciseName)
            Text("\(formattedTime)")
            Button(action: {
                startTimer()
            }, label: {
                Text("Start Timer")
            })
            .disabled(timerRunning)
        }
        .navigationTitle("\(exercise.title)")
        .onAppear {
            secondsRemaining = exercise.duration * 60
            // Muestra el primer ejercicicio
            currentExerciseName = exercise.exercises[currentExerciseIndex].name
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
            if timerRunning {
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                } else {
                    stopTimer()
                }
                
                //Camnbiar el nombre cada minuto
                if secondsRemaining % 60 == 0 {
                    currentExerciseIndex += 1
                    currentExerciseName = exercise.exercises[currentExerciseIndex].name
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
