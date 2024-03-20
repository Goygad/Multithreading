//
//  TaskSixViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskSixViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
}
    
// Выведется А С В потому, что код внутри DispatchQueue.main.async будет выполнен после завершения основного потока


