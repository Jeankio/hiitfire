//
//  HiitSessionsDetailView.swift
//  hiitfire
//
//  Created by Jean Karel on 26/04/23.
//

import SwiftUI

struct HiitSessionsDetailView: View {
    //Presental modalview for editview
    @State private var isPresentingEditView = false
    let exercise: HiitTraining
    
    var body: some View {
        List {
            Section(header: Text("Training info")) {
                // Navegacion desde Detailview a HiitTrainingView
                NavigationLink(destination: HiitTrainingView()) {
                    Label("Start HIIT session", systemImage: "timer.square")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Duration", systemImage: "clock")
                    Spacer()
                    Text("\(exercise.duration) minutes")
                }
                HStack {
                    Label("Set color", systemImage: "paintpalette")
                    Spacer()
                    Text(exercise.theme.name)
                        .padding(4)
                        .foregroundColor(exercise.theme.accentColor)
                        .background(exercise.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            Section(header: Text("You will burn")) {
                //Promedio de calorias quemadas por minuto vs. Duration
                let caloriesBurned = Int(Double(exercise.duration) * 9.3)
                Label("\(caloriesBurned) Calories", systemImage: "flame.fill")
                    .bold()
                    .font(.system(size: 18))
                //.frame(maxWidth:.infinity, alignment: .center)
            }
            
            
            Section(header: Text("HIIT exercises")) {
                ForEach(exercise.exercises) { exercise in
                    Label(exercise.name, systemImage: "figure.dance")
                }
            }
        }
        .navigationTitle(exercise.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        // sheet for editview
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                HiitSessionsEditView()
                    .navigationBarTitle(exercise.title)
                //Cancelar la edicion
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        // Guardar la edicion
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                        }
                    }
                }
            }
        }
    }
}

struct HiitSessionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HiitSessionsDetailView(exercise: HiitTraining.backTraining[0])
        }
    }
}
