//
//  TaskEightViewController.swift
//  Multithreading
//
//  Created by Balik on 20.03.2024.
//

import UIKit

class TaskEightViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(await printMessage())
        }
    }
    
    func printMessage() async {
        let string = await withTaskGroup(of: String.self) { group -> String in
            
            let strings = ["Hello", "My", "Road", "Map", "Group"]
            
            for string in strings {
                group.addTask {
                    string
                }
            }
            
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        print(string)
    }
}
