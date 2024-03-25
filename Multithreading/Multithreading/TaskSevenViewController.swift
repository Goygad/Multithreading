//
//  TaskSevenViewController.swift
//  Multithreading
//
//  Created by Balik on 20.03.2024.
//

import UIKit
class TaskSevenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await getAverageTemperature()
        }
    }
    
    func getAverageTemperature() async {
        let fetchTask = Task { () -> Double in
            
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            let sum = readings.reduce(0, +)
            return sum / Double(readings.count)
        }
        
        // Отмена
            fetchTask.cancel()
        
        do {
            let result = try await fetchTask.value
            print("Average temperature: \(result)")
        } catch {
            print("Failed to get data.")
        }
    }
}
