

import SwiftUI

struct ActitivitiesHistoryView: View {
    var trainings: [HiitTraining]
    //@State var currentExerciseIndex = 0
    @Environment(\.presentationMode) var presentationMode
    
    var allHistory: [SessionsHistory] {
        var history = [SessionsHistory]()
        
        for training in trainings {
            history += training.history
        }
        
        return history
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Session History")) {
                    if allHistory.isEmpty {
                        Label("No HIIT Sessions yet", systemImage: "calendar.badge.exclamationmark")
                    }
                    ForEach(trainings) { training in
                        
                        ForEach(training.history) { history in
                            VStack {
                                HStack {
                                    Text(history.title)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Spacer()
                                }
                                //Spacer()
                                HStack {
                                    Image(systemName: "clock")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Text("\(history.duration)")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Spacer()
                                }
                                //Spacer()
                                HStack {
                                    Image(systemName: "flame.fill")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Text("\(history.caloriesBourned)")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Spacer()
                                }
                                //Spacer()
                                HStack {
                                    Image(systemName: "calendar")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Text(history.date, style: .date)
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(training.theme.mainColor)
                                    Spacer()
                                }
                            }
                        }
                        
                    }
                }
            }// List
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Sessions History")
                        .font(.headline)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.blue)
                    .imageScale(.large)
            })
            .navigationTitle("Activities")
        }
    }
}

struct ActitivitiesHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ActitivitiesHistoryView(trainings: HiitTraining.backTraining)
    }
}
