//
//  ContentView.swift
//  hiitfire
//
//  Created by Jean Karel on 25/04/23.
//

import SwiftUI

struct HiitTrainingView: View {
    var body: some View {
        VStack {
           ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Llevas:")
                        .font(.caption)
                    Label("300", systemImage: "timer.circle")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Te faltan:")
                        .font(.caption)
                    Label("600", systemImage: "timer.circle.fill")
                }
            }
            Circle()
                .stroke(lineWidth: 25)
            HStack {
                Text("Excersice 1 de 7")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "pause.fill")
                }
            }
        }
        .padding()
    }
}

struct HiitTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        HiitTrainingView()
    }
}
