

import SwiftUI

struct CountDownTimerView: View {
    
    @Binding var exercise: HiitTraining
    // Variable para el ejercicio actual
    @State var currentExerciseIndex: Int
    
    @State private var secondsRemaining = 0
    @State private var timerRunning = false
    // Nuevo estado para cambiar el nombre cada minuto
    @State private var currentExerciseName = ""
    @State private var restTimeRemaining = 0
    @State private var elapsedTime = 0
    // Progress view
    @State var progressValue = 0.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(exercise.theme.mainColor)
            VStack {
                HiitSessionProgressView(theme: exercise.theme, progressValue: progressValue)
                // Para mostrar el nombre del ejercicio actual
                Text(currentExerciseName)
                    .font(.largeTitle)
                Text("\(formattedTime)")
                    .font(.title)
                Button(action: {
                    startTimer(timerRunning: $timerRunning)
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
                restTimeRemaining = 0
                elapsedTime = 0
                // ProgresView
                progressValue = 0.0
            }
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect(), perform: { _ in
                if timerRunning {
                    if secondsRemaining > 0 {
                        secondsRemaining -= 1
                        
                        //Actualizar el progreso cada segundo
                        let totalDuration = exercise.duration * 60
                        let remainingDuration = Double(secondsRemaining)
                        progressValue = (Double(totalDuration) - remainingDuration) / Double(totalDuration)
                        
                    } else {
                        stopTimer(timerRunning: $timerRunning)
                    }
                    
                    //Cambiar el nombre cada minuto
                    if secondsRemaining % 60 == 0 {
                        currentExerciseIndex += 1
                        if currentExerciseIndex >= exercise.exercises.count {
                            currentExerciseIndex = 0
                        }
                        currentExerciseName = exercise.exercises[currentExerciseIndex].name
                    }
                    // Cambiar el nombre a Rest si quedan menos de 30 segundos
                    if secondsRemaining % 60 >= 30 {
                        currentExerciseName = exercise.exercises[currentExerciseIndex].name
                    } else {
                        currentExerciseName = "Rest"
                    }
                }
            })
            
        } // Zstack
        .padding()
        .foregroundColor(exercise.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Hacer que el contador sea minutos con segundos
    var formattedTime: String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


func startTimer(timerRunning: Binding<Bool>) {
    timerRunning.wrappedValue = true
}

func stopTimer(timerRunning: Binding<Bool>) {
    timerRunning.wrappedValue = false
}




struct CountDownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountDownTimerView(exercise: .constant(HiitTraining.emptyExercise), currentExerciseIndex: 0)
    }
}
