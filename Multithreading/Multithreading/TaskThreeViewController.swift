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
        
        let serialQueue = DispatchQueue(label: "com.example.myQueue", attributes: .concurrent)
        
        serialQueue.async {
            //            serialQueue.async {
            serialQueue.sync {
                print("This will never be printed.")
            }
        }
    }
}
// Проблема deadLock, очередь блокирует саму себя
