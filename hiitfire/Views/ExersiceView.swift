
import SwiftUI


struct ExersiceView: View {
    
let exersices: [HiitTraining]
    var body: some View {
        List(exersices) { exersice in
            CardTrainingView(exersice: exersice)
                .listRowBackground(exersice.theme.mainColor)
        }
    }
}

//struct ExersiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExersiceView(exersices: HiitTraining.backTraining)
//    }
//}
