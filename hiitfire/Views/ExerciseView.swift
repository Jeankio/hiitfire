
import SwiftUI


struct ExerciseView: View {
    // let to Binding / Bindear $ todo
    @Binding var exercises: [HiitTraining]
    // Habilitar Add New HittSession
    @State private var isPresentingNewExerciseView = false
    // for add
    @State private var newExcercise = HiitTraining.emptyExercise
    @State private var selectedExercise = HiitTraining.emptyExercise
    
    var body: some View {
        NavigationView {
            List {
                ForEach($exercises) { $exercise in
                    NavigationLink(destination: HiitSessionsDetailView(exercise: $exercise, onSave: {
                        exercises.persist()
                    })) {
                        CardTrainingView(exercise: exercise)
                    }
                    .listRowBackground(exercise.theme.mainColor)
                }
                .onDelete { indexSet in
                    exercises.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("HIIT Sessions")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresentingNewExerciseView = true
                    }) {
                        Image(systemName: "plus.app")
                    }
                }
            }
            // Habilitar el add button
            .sheet(isPresented: $isPresentingNewExerciseView) {
                NavigationView {
                    HiitSessionsEditView(exercise: $newExcercise)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingNewExerciseView = false
                                    // Limpiar la pantalla
                                    newExcercise = HiitTraining.emptyExercise
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    exercises.add(training: newExcercise)
                                    isPresentingNewExerciseView = false
                                    // Limpiar la pantalla
                                    newExcercise = HiitTraining.emptyExercise
                                }
                            }
                        }
                }
            }
            .task {
                exercises.load()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ActitivitiesHistoryView(exercise: $selectedExercise)) {
                        Image(systemName: "flame.fill")
                    }
                }
            }
        }
    }
}




struct exerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercises: .constant(HiitTraining.backTraining))
    }
}
