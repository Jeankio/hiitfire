

import SwiftUI

struct CardTrainingView: View {
    let exersice: HiitTraining
    var body: some View {
        VStack(alignment: .leading) {
            Text(exersice.title)
                .font(.headline)
                .bold()
            Spacer()
            HStack {
                Label("\(exersice.exersices.count)", systemImage: "figure.run.square.stack.fill")
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                Label("\(exersice.calories)", systemImage: /*@START_MENU_TOKEN@*/"flame.fill"/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 20))
                    .bold()
                Spacer()
                Label("\(exersice.timeMinutes)", systemImage: "clock")
                    .font(.system(size: 20))
                    .bold()
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
