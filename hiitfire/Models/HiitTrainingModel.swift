
import Foundation

struct HiitTraining {
    var title: String
    var exercise: [String]
    var timeMinutes: Int
    var calories: Int
}

extension HiitTraining {
    
    static let backTraining: [HiitTraining] =
    
    [
        HiitTraining(title: "Basic to HIIT",
                     exercise: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 10,
                     calories: 95),
        HiitTraining(title: "Tops of HIIT",
                     exercise: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 20,
                     calories: 125),
        HiitTraining(title: "Burn fat yeah!",
                     exercise: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 30,
                     calories: 150),
        HiitTraining(title: "HIIT and more",
                     exercise: ["Jumping Jacks", "Burpees", "Jump Squats", "High knees", "Walkout"],
                     timeMinutes: 30,
                     calories: 175),
    ]
}
