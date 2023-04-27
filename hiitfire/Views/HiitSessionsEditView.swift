//
//  HiitSessionsEditView.swift
//  hiitfire
//
//  Created by Jean Karel on 27/04/23.
//

import SwiftUI

struct HiitSessionsEditView: View {
    //State para verificar cambios en el view local y aplicarlos
    @State private var exercise = HiitTraining.emptyExercise
    //Agregar un nuevo nombre de ejericio desde este view???? como???
    @State private var newExerciseName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Training settings")) {
                TextField("Session Title", text: $exercise.title)
                HStack {
                    Slider(value: $exercise.durationDouble, in: 5...30, step: 1) {
                        Text("Duration")
                    }
                    Spacer()
                    Text("\(exercise.duration) Minutes")
                }
            }
            Section(header: Text("Exercises")) {
                //ForEach para montras los ejercicios
                ForEach(exercise.exercises) { exercise in
                    Text(exercise.name)
                }
                // Eliminar ejericios
                .onDelete { indices in
                    exercise.exercises.remove(atOffsets: indices)
                }
                // Agregar ejercicios
                HStack {
                    TextField("Add Exercise", text: $newExerciseName)
                    Button(action: {
                        withAnimation {
                            let newExercise = HiitTraining.exercise(id: UUID(), name: newExerciseName)
                            exercise.exercises.append(newExercise)
                            newExerciseName = ""
                        }
                    }) {
                        Image(systemName: "plus.square.on.square")
                    }
                    .disabled(newExerciseName.isEmpty)
                }
            }
        }
    }
}

struct HiitSessionsEditView_Previews: PreviewProvider {
    static var previews: some View {
        HiitSessionsEditView()
    }
}
