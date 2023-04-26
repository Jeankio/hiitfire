//
//  HiitSessionsDetailView.swift
//  hiitfire
//
//  Created by Jean Karel on 26/04/23.
//

import SwiftUI

struct HiitSessionsDetailView: View {
    let exersice: HiitTraining
    var body: some View {
        List {
            Section(header: Text("Training Settings")) {
                Label("Start HIIT session", systemImage: "timer.square")
                    .font(.headline)
                    .foregroundColor(.accentColor)
                HStack {
                    Label("Duration", systemImage: "clock")
                    Spacer()
                    Text("\(exersice.timeMinutes) minutes")
                    }
                HStack {
                    Label("Set color", systemImage: "paintpalette")
                    Spacer()
                    Text(exersice.theme.name)
                        .padding(4)
                        .foregroundColor(exersice.theme.accentColor)
                        .background(exersice.theme.mainColor)
                        .cornerRadius(4)
                }
            }
            
            Section(header: Text("You will burn")) {
                let caloriesBurned = Int(Double(exersice.timeMinutes) * 9.3)
                Label("\(caloriesBurned) Calories", systemImage: "flame.fill")
                    .bold()
                    .font(.system(size: 18))
                    //.frame(maxWidth:.infinity, alignment: .center)
            }
           
            
            Section(header: Text("HIIT Exersices")) {
                ForEach(exersice.exersices) { exersice in
                    Label(exersice.name, systemImage: "figure.dance")
                }
            }
        }
    }
}

struct HiitSessionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HiitSessionsDetailView(exersice: HiitTraining.backTraining[0])
        }
    }
}
