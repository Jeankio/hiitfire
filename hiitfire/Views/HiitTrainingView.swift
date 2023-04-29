

import SwiftUI

struct HiitTrainingView: View {
    @Binding var exercise: HiitTraining
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(exercise.theme.mainColor)
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
        }
        .padding()
        .foregroundColor(exercise.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HiitTrainingView_Previews: PreviewProvider {
    static var previews: some View {
        HiitTrainingView(exercise: .constant(HiitTraining.backTraining[0]))
    }
}
