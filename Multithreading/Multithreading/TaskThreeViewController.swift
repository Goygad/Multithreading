//
//  TaskTwoViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskThreeViewController: UIViewController {

        override func viewDidLoad() {
                super.viewDidLoad()
            
            print("Task 1 is finished")
           
            Task.detached(priority: .userInitiated)  {
                for i in 0..<50 {
                    print(i)
                }
                print("Task 2 is finished")
                print(Thread.current)
            }
            
            print("Task 3 is finished")
        }
    }
// Разницы при выводе кода выявлено не было
