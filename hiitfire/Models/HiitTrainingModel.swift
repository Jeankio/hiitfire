
import Foundation

struct HiitTraining: Identifiable {
    let id: UUID
    var title: String
    var exersices: [String]
    var timeMinutes: Int
    var calories: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, exersices: [String], timeMinutes: Int, calories: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.exersices = exersices
        self.timeMinutes = timeMinutes
        self.calories = calories
        self.theme = theme
    }
}

extension HiitTraining {
    
    static let backTraining: [HiitTraining] =
    
    [
        HiitTraining(title: "Basic to HIIT",
                     exersices: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 10,
                     calories: 95, theme: .indigo),
        HiitTraining(title: "Tops of HIIT",
                     exersices: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 20,
                     calories: 125, theme: .magenta),
        HiitTraining(title: "Burn fat yeah!",
                     exersices: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 30,
                     calories: 150, theme: .oxblood),
        HiitTraining(title: "HIIT and more",
                     exersices: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 30,
                     calories: 175, theme: .seafoam),
    ]
}
