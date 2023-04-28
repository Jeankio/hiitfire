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
    // ejercicio aleatorio viene del Enum
    @State private var selectedExercise: ExerciseList?
    //Para inhabilitar el botón aleatorio cuando hay un nuevo ejercicio
        var offRandomButton: Bool {
            return !newExerciseName.isEmpty
        }
    
    
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
            
            Section(header: Text("You will burn")) {
                //Promedio de calorias quemadas por minuto vs. Duration
                let caloriesBurned = calculateCaloriesBurned(duration: exercise.duration)
                Label("\(caloriesBurned) Calories", systemImage: "flame.fill")
                    .bold()
                    .font(.system(size: 18))
                //.frame(maxWidth:.infinity, alignment: .center)
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
                    // Boton aleatorio
                    Section {
                        Button(action: {
                            selectedExercise = ExerciseList.allCases.randomElement()
                            if let selectedExercise = selectedExercise {
                                let newExercise = HiitTraining.exercise(id: UUID(), name: selectedExercise.rawValue)
                                exercise.exercises.append(newExercise)
                            }
                        }) {
                            Image(systemName: "shuffle")
                        }
                        .disabled(offRandomButton)
                        .buttonStyle(BorderlessButtonStyle())
                        .layoutPriority(1)
                    }
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
                    // Desactiva el boton sin agregar para no agregar campos vacios
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
