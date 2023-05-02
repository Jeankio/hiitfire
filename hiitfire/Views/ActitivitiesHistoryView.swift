

import SwiftUI

struct ActitivitiesHistoryView: View {
    @Binding var exercise: HiitTraining
    @Environment(\.presentationMode) var presentationMode
   
    
        var body: some View {
        VStack {
            List {
                Section(header: Text("Session History")) {
                    if exercise.history.isEmpty {
                        Label("No HIIT Sessions yet", systemImage: "list.bullet.below.rectangle")
                    }
                    ForEach(exercise.history) { history in
                        VStack {
                            HStack {
                                Text(history.title)
                                Image(systemName: "list.bullet.clipboard.fill")
                            }
                            Text(history.date, style: .date)
                            Text(history.title)
                        }
                    }
                }
            }
        }
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

struct ActitivitiesHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ActitivitiesHistoryView(exercise: .constant(HiitTraining.backTraining[0]))
    }
}
