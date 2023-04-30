

import Foundation

struct SessionsHistory: Identifiable {
    let id: UUID
    let date: Date
    var exercices: [HiitTraining.exercise]
    
    init(id: UUID = UUID(), date: Date = Date(), exercices: [HiitTraining.exercise]) {
        self.id = id
        self.date = date
        self.exercices = exercices
    }
}
