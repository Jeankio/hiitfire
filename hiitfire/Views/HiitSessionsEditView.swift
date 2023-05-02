//
//  HiitSessionsEditView.swift
//  hiitfire
//
//  Created by Jean Karel on 27/04/23.
//
import SwiftUI

struct HiitSessionsEditView: View {
    //State para verificar cambios en el view local y aplicarlos
    // Se anula el state para conectar editView con DetailView
    @Binding var exercise: HiitTraining
    //Agregar un nuevo nombre de ejericio desde este view???? como???
    @State private var newExerciseName = ""
    // ejercicio aleatorio viene del Enum
    @State private var selectedExercise: ExerciseList?
    //Para inhabilitar el botón aleatorio cuando hay un nuevo ejercicio
    var offRandomButton: Bool {
        return !newExerciseName.isEmpty
    }
    // Mostrar alerta al usuario para gregar ejercicios de acuerdo a la duracion establecida
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Training settings")) {
                TextField("Session Title", text: $exercise.title)
                HStack {
                    Slider(value: $exercise.durationDouble, in: 5...30, step: 5) {
                        Text("Duration")
                    }
                    Spacer()
                    Text("\(exercise.duration) Minutes")
                }
                ThemePickerView(selection: $exercise.theme)
            }
            
            Section(header: Text("You will burn")) {
                //Se llama a la funcion de las calorias
                Label("\(exercise.calories) Calories", systemImage: "flame.fill")
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
                            let maxExercises = Int(exercise.duration / 1)
                            if exercise.exercises.count < maxExercises {
                                selectedExercise = ExerciseList.allCases.randomElement()
                                if let selectedExercise = selectedExercise {
                                    let newExercise = HiitTraining.Exercise(id: UUID(), name: selectedExercise.rawValue)
                                    exercise.exercises.append(newExercise)
                                }
                            } else {
                                showAlert = true
                                alertMessage = "Sorry, you have reached the maximum number of exercises for the selected duration."
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
                            let newExercise = HiitTraining.Exercise(id: UUID(), name: newExerciseName)
                            let maxExercises = Int(exercise.duration / 1)
                            if exercise.exercises.count < maxExercises {
                                exercise.exercises.append(newExercise)
                                newExerciseName = ""
                            } else {
                                showAlert = true
                                alertMessage = "Sorry, you have reached the maximum number of exercises for the selected duration."
                            }
                        }
                    }) {
                        Image(systemName: "plus.square.on.square")
                        
                    }
                    // Desactiva el boton sin agregar para no agregar campos vacios
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Limit Reached"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        // Desactiva el boton sin agregar para no agregar campos vacios
                    }
                    // || deshabilita el boton azul +
                    .disabled(newExerciseName.isEmpty  || exercise.exercises.count >= Int(exercise.duration / 1))
                }
            }
        }
    }
}


struct HiitSessionsEditView_Previews: PreviewProvider {
    static var previews: some View {
        HiitSessionsEditView(exercise: .constant(HiitTraining.backTraining[0]))
    }
}
