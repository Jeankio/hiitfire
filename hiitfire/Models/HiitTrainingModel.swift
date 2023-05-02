
import Foundation

struct HiitTraining: Identifiable, Codable {
    let id: UUID
    var title: String
    var exercises: [exercise]
    var theme: Theme
    var duration: Int
    // Convertir duration en double para el slider
    var durationDouble: Double {
        get {
            Double(duration)
        }
        
        set {
            duration = Int(newValue)
            
        }
    }
    
    var calories: Int {
        get {
            return Int(Double(duration) * 10.3)
        }
        set {
            // No se hace nada porque las calorías quemadas se calculan en función de la duración
        }
    }
    
    var history: [SessionsHistory] = []
    
    init(id: UUID = UUID(), title: String, exercises: [String], duration: Int, calories: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.exercises = exercises.map { exercise(id: UUID(), name: $0) }
        self.duration = duration
        //self.calories = calories
        self.theme = theme
    }
    
    var isValid: Bool {
            return !title.isEmpty && !exercises.isEmpty && duration > 0
        }
}

extension HiitTraining {
    struct exercise: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID, name: String) {
            self.id = id
            self.name = name
        }
    }
    // Aqui inicia el setup de la view de editar hiit sessions
    static var emptyExercise: HiitTraining {
        HiitTraining(title: "", exercises: [], duration: 0, calories: 0, theme: .seafoam)
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
