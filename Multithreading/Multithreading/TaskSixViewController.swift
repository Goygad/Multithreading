//
//  TaskSixViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskSixViewController: UIViewController {
    
    class RecipeViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            DispatchQueue.global().async {
                self.thread1()
            }
            
            DispatchQueue.global().async {
                self.thread2()
            }
        }

        let resourceASemaphore = DispatchSemaphore(value: 1)
        let resourceBSemaphore = DispatchSemaphore(value: 1)
        
        func thread1() {
            print("Поток 1 пытается захватить Ресурс A")
            resourceASemaphore.wait()
            
            print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
            Thread.sleep(forTimeInterval: 1)
            
            print("Поток 1 захватил Ресурс B")
            
            //resourceBSemaphore.signal()
            resourceASemaphore.signal()
        }
        
        func thread2() {
            print("Поток 2 пытается захватить Ресурс B")
            resourceBSemaphore.wait()
            
            print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
            Thread.sleep(forTimeInterval: 1)
            
            // resourceASemaphore.wait() 
            print("Поток 2 захватил Ресурс A")
            
            //resourceASemaphore.signal()
            resourceBSemaphore.signal()
        }
    }
}
// LiveLock у нас сейчас нету, тк строчки за это отвечающие уже закомменчены
