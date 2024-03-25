//
//  ViewController.swift
//  Multithreading
//
//  Created by Balik on 18.03.2024.
//

import UIKit

class TaskOneViewController: UIViewController {
        
        override func viewDidLoad() {
                super.viewDidLoad()
            
            print(1)
            Task {
                print(2)
            }
            print(3)
        }
    }
// Печать: 1, 3, 2 тк 2 с основного потока отправляется в очередь
// Ничего не поменялось тк по умолчанию Task {
// Выполняется асинхронно в основном потоке }

