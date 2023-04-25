//
//  CardTrainingView.swift
//  hiitfire
//
//  Created by Jean Karel on 25/04/23.
//

import SwiftUI

struct CardTrainingView: View {
    let exersice: HiitTraining
    var body: some View {
        VStack(alignment: .leading) {
            Text(exersice.title)
                .font(.headline)
            Spacer()
            HStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Label("\(exersice.exersices.count)", systemImage: "figure.run.square.stack.fill")
                Spacer()
                Label("\(exersice.calories)", systemImage: /*@START_MENU_TOKEN@*/"flame.fill"/*@END_MENU_TOKEN@*/)
                Spacer()
                Label("\(exersice.timeMinutes)", systemImage: /*@START_MENU_TOKEN@*/"timer.square"/*@END_MENU_TOKEN@*/)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(exersice.theme.accentColor)
    }
}

struct CardTrainingView_Previews: PreviewProvider {
    static var exersice = HiitTraining.backTraining[0]
    static var previews: some View {
        CardTrainingView(exersice: exersice)
            .background(exersice.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
