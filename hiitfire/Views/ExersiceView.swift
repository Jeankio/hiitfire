
import SwiftUI


struct ExersiceView: View {
    
    let exersices: [HiitTraining]
    var body: some View {
        NavigationStack {
            List(exersices) { exersice in
                NavigationLink(destination: HiitSessionsDetailView(exersice: exersice)) {
                    CardTrainingView(exersice: exersice)
                }
                .listRowBackground(exersice.theme.mainColor)
            }
            .navigationTitle("HIIT Sessions")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus.app")
                }
            }
        }
    }
}

struct ExersiceView_Previews: PreviewProvider {
    static var previews: some View {
        ExersiceView(exersices: HiitTraining.backTraining)
    }
}
