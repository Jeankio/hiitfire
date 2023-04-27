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
        }
    }
}

struct HiitSessionsEditView_Previews: PreviewProvider {
    static var previews: some View {
        HiitSessionsEditView()
    }
}
