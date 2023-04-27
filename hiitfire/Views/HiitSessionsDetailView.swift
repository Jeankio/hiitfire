//
//  HiitSessionsDetailView.swift
//  hiitfire
//
//  Created by Jean Karel on 26/04/23.
//

import SwiftUI

struct HiitSessionsDetailView: View {
    let exercise: HiitTraining
    var body: some View {
        List {
            Section(header: Text("Training Settings")) {
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
    }
}

struct HiitSessionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HiitSessionsDetailView(exercise: HiitTraining.backTraining[0])
        }
    }
}
