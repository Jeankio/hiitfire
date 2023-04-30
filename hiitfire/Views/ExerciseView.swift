
import SwiftUI


struct ExerciseView: View {
    // let to Binding / Bindear $ todo
    @Binding var exercises: [HiitTraining]
    // Habilitar Add New HittSession
    @State private var isPresentingNewExerciseView = false
    
    var body: some View {
        NavigationView {
            List($exercises) { $exercise in
                NavigationLink(destination: HiitSessionsDetailView(exercise: $exercise)) {
                    CardTrainingView(exercise: exercise)
                }
                .listRowBackground(exercise.theme.mainColor)
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
            .sheet(isPresented: $isPresentingNewExerciseView) {
                NewHIITSessionsSheet(exercises: $exercises, isPresentingNewExerciseView: $isPresentingNewExerciseView)
            }
        }
    }
}




struct exerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercises: .constant(HiitTraining.backTraining))
    }
}
