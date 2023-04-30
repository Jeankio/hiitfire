
import SwiftUI


struct ExerciseView: View {
    // let to Binding / Bindear $ todo
    @Binding var exercises: [HiitTraining]
    // Habilitar Add New HittSession
    @State private var isPresentingNewExerciseView = false
    // for add
    @State private var newExcercise = HiitTraining.emptyExercise
    
    var body: some View {
            NavigationView {
                List {
                    ForEach($exercises) { $exercise in
                        NavigationLink(destination: HiitSessionsDetailView(exercise: $exercise)) {
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
                                exercises.append(newExcercise)
                                isPresentingNewExerciseView = false
                                // Limpiar la pantalla
                                newExcercise = HiitTraining.emptyExercise
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: ActitivitiesHistoryView()) {
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
