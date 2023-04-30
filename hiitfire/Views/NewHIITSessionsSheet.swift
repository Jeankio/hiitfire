//
//  NewHIITSessionsSheet.swift
//  hiitfire
//
//  Created by Jean Karel on 30/04/23.
//

import SwiftUI

struct NewHIITSessionsSheet: View {
    @State private var newExcercise = HiitTraining.emptyExercise
    @Binding var exercises: [HiitTraining]
    @Binding var isPresentingNewExerciseView: Bool
    
    var body: some View {
        NavigationView {
            HiitSessionsEditView(exercise: $newExcercise)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewExerciseView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                        exercises.append(newExcercise)
                        isPresentingNewExerciseView = false
                    }
                }
            }
        }
    }
}

struct NewHIITSessionsSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewHIITSessionsSheet(exercises: .constant(HiitTraining.backTraining),
                             isPresentingNewExerciseView: .constant(true))
    }
}
