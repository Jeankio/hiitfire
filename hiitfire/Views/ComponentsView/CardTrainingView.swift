

import SwiftUI

struct CardTrainingView: View {
    let exercise: HiitTraining
    var body: some View {
        VStack(alignment: .leading) {
            Text(exercise.title)
                .font(.headline)
                .bold()
            Spacer()
            HStack {
                Label("\(exercise.exercises.count)", systemImage: "figure.run.square.stack.fill")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                Label("\(exercise.calories)", systemImage: /*@START_MENU_TOKEN@*/"flame.fill"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                Label("\(exercise.duration)", systemImage: "clock")
                    .font(.system(size: 20))
                    .bold()
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
    }
}

struct CardTrainingView_Previews: PreviewProvider {
    static var exercise = HiitTraining.backTraining[0]
    static var previews: some View {
        CardTrainingView(exercise: exercise)
            .background(exercise.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
