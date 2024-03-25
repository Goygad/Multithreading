//
//  TaskTwoViewController.swift
//  Multithreading
//
//  Created by Balik on 18.03.2024.
//

import UIKit

class TaskTwoViewController: UIViewController {
        
        override func viewDidLoad() {
                super.viewDidLoad()
            
            print(1)
            Task { @MainActor  in
                print(2)
            }
            print(3)
        }
    }
//Добавляя @MainActor атрибут мы гарантируем, что все операции, связанные с этими элементами, выполняются исключительно в основном потоке. 
