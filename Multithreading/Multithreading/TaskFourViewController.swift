//
//  TaskThreeViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        func randomD6() async  -> Int {
            
            Int.random(in: 1...6)
        }
        Task {
            let result = await randomD6()
            print(result)
        }
    }
}
