

import Foundation

struct SessionsHistory: Identifiable, Codable {
    let id: UUID
    var title: String
    var duration: Int
    var caloriesBourned: Int
    var date: Date
    
    init(id: UUID, title: String, duration: Int, caloriesBourned: Int, date: Date) {
        self.id = id
        self.title = title
        self.duration = duration
        self.caloriesBourned = caloriesBourned
        self.date = date
    }
    
}
