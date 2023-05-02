//
//  PersistenceModel.swift
//  hiitfire
//
//  Created by Jean Karel on 2/05/23.
//

import Foundation

extension HiitTraining {
    
    //Persistencia con FileManager paso 2 (1 Volver todo Codable)
    private var exercisesFile: URL {
        do {
            let documentsDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentsDirectory.appendingPathComponent("exercises")
        }
        catch {
            fatalError("Can't find exercises file: \(error)")
        }
    }
    
    // Persistencia guardar exercices paso 3
    func saveExercises() {
        do {
            let encodedData = try JSONEncoder().encode(exercises)
            try encodedData.write(to: exercisesFile)
        }
        catch {
            fatalError("Can't encode exercises: \(error)")
        }
    }

    mutating func loadExercise() {
        guard let data = try? Data(contentsOf: exercisesFile) else {return}
        do {
            let savedExercises = try JSONDecoder().decode([exercise].self, from: data)
            exercises = savedExercises
        }
        catch {
            fatalError("Can't load exercises: \(error)")
        }
    }

    mutating func add(exercise: HiitTraining) {
        if exercise.isValid {
            exercises.append(contentsOf: exercise.exercises)
            saveExercises()
        }
    }
}
