
import SwiftUI


struct ExerciseView: View {
    // let to Binding / Bindear $ todo
    @Binding var exercises: [HiitTraining]
    
    var body: some View {
        NavigationStack {
            List($exercises) { $exercise in
                NavigationLink(destination: HiitSessionsDetailView(exercise: $exercise)) {
                    CardTrainingView(exercise: exercise)
                }
                .listRowBackground(exercise.theme.mainColor)
                
            }
        }
        .navigationTitle("HIIT Sessions")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus.app")
            }
        }
    }
}


struct exerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView(exercises: .constant(HiitTraining.backTraining))
    }
}
