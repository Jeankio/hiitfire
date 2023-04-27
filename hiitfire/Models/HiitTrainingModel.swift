
import Foundation

struct HiitTraining: Identifiable {
    let id: UUID
    var title: String
    var exercises: [exercise]
    var duration: Int
    var calories: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, exercises: [String], duration: Int, calories: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.exercises = exercises.map { exercise(id: UUID(), name: $0) }
        self.duration = duration
        self.calories = calories
        self.theme = theme
    }
}

extension HiitTraining {
    struct exercise: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID, name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension HiitTraining {
    
    static let backTraining: [HiitTraining] =
    
    [
        HiitTraining(title: "Basic to HIIT",
                     exercises: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     duration: 10,
                     calories: 95, theme: .indigo),
        HiitTraining(title: "Tops of HIIT",
                     exercises: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     duration: 20,
                     calories: 125, theme: .magenta),
        HiitTraining(title: "Burn fat yeah!",
                     exercises: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     duration: 30,
                     calories: 150, theme: .oxblood),
        HiitTraining(title: "HIIT and more",
                     exercises: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout", "Thruster"],
                     duration: 30,
                     calories: 175, theme: .seafoam),
    ]
}
