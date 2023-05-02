//
//  PersistenceModel.swift
//  hiitfire
//
//  Created by Jean Karel on 2/05/23.
//

import Foundation

extension Array where Element == HiitTraining {
    private var hiitTrainingsFile: URL {
        do {
            let documentsDirectory = try FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            return documentsDirectory.appendingPathComponent("exercises.json")
        }
        catch {
            fatalError("Can't find exercises file: \(error)")
        }
    }
    
    func persist() {
        do {
            let encodedData = try JSONEncoder().encode(self)
            try encodedData.write(to: hiitTrainingsFile)
        }
        catch {
            fatalError("Can't encode exercises: \(error)")
        }
    }
    
    mutating func load() {
        guard let data = try? Data(contentsOf: hiitTrainingsFile) else {return}
        do {
            let trainings = try JSONDecoder().decode([HiitTraining].self, from: data)
            self.removeAll(where: { _ in true })
            self.append(contentsOf: trainings)
        }
        catch {
            fatalError("Can't load exercises: \(error)")
        }
    }
    
    mutating func add(training: HiitTraining) {
        if training.isValid {
            self.append(training)
            persist()
        }
    }
}
