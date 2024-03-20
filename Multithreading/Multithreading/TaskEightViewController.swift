//
//  TaskEightViewController.swift
//  Multithreading
//
//  Created by Balik on 20.03.2024.
//

import UIKit

class TaskEightViewController: UIViewController {

        private lazy var name = "I love RM"
    let lock = NSLock()

           override func viewDidLoad() {
               super.viewDidLoad()
               
               updateName()
           }
           
           func updateName() {
               DispatchQueue.global().async {
                   self.lock.lock()
                   print(self.name)
                   print(Thread.current)
                   self.lock.unlock()
               }
               
               self.lock.lock()
               print(self.name) 
               self.lock.unlock()
           }
    }
  
//Проблема в том что идет обращение к name из разных потоков, что приводит к неопределённому выводу
//Data race in Multithreading.TaskEightViewController.name.getter : Swift.String at 0x111301000
//указывает на обнаружение гонки данных(Data race)

