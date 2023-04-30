

import SwiftUI

struct ActitivitiesHistoryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
           // Algo aqui
            Spacer()
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
        NavigationView {
            ActitivitiesHistoryView()
        }
    }
}
