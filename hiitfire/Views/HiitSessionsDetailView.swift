
import SwiftUI

struct HiitSessionsDetailView: View {
    // Convertir en Binding:
    @Binding var exercise: HiitTraining
    //For binding edtView:
    @State private var editingSession = HiitTraining.emptyExercise
    //Presenta modalview for editview
    @State private var isPresentingEditView = false
    // Estado para definir el ejercicio actual
    @State private var currentExerciseIndex = 0
    
    
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Training info")) {
                    HStack {
                        Label("Duration", systemImage: "clock")
                        Spacer()
                        Text("\(exercise.duration) minutes")
                    }
                    HStack {
                        Label("Set color", systemImage: "paintpalette")
                        Spacer()
                        Text(exercise.theme.name)
                            .padding(4)
                            .foregroundColor(exercise.theme.accentColor)
                            .background(exercise.theme.mainColor)
                            .cornerRadius(4)
                    }
                }
                Section(header: Text("You will burn")) {
                    //Se llama a la funcion de las calorias
                    Label("\(exercise.calories) KCal", systemImage: "flame.fill")
                        .bold()
                        .font(.system(size: 30))
                        .frame(maxWidth:.infinity, alignment: .center)
                }
                /*Section(header: Text("Session History")) {
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
                }*/
            } // List
            .navigationTitle(exercise.title)
            .toolbar {
                Button("Edit") {
                    isPresentingEditView = true
                    editingSession = exercise
                }
            }
            // sheet for editview
            .sheet(isPresented: $isPresentingEditView) {
                NavigationStack {
                    //Actualizar HSEV con el binding:
                    HiitSessionsEditView(exercise: $editingSession)
                        .navigationBarTitle(exercise.title)
                    //Cancelar la edicion
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingEditView = false
                                }
                            }
                            // Guardar la edicion
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentingEditView = false
                                    exercise = editingSession
                                }
                            }
                        }
                }
            }
        } // Vstack
        VStack {
            List {
                Section(header: Text("Your exercises")) {
                    ForEach(exercise.exercises) { exercise in
                        Label(exercise.name, systemImage: "figure.dance")
                    }
                }
            }
        }
        VStack {
            NavigationLink(destination: CountDownTimerView(exercise: $exercise, currentExerciseIndex: currentExerciseIndex)) {
                Text("Go")
                    .frame(width: 100, height: 100)
                    .foregroundColor(exercise.theme.accentColor)
                    .background(exercise.theme.mainColor)
                    .clipShape(Circle())
                    .padding(.top, 20)
            }
            //Pasarle el ejercicio al boton
            .onTapGesture {
                currentExerciseIndex = 0 // Establecer el índice del ejercicio actual
            }
            .shadow(radius: 10)
        }
    } // Var body
}// Struct

struct HiitSessionsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HiitSessionsDetailView(exercise: .constant(HiitTraining.backTraining[0]))
        }
    }
}
