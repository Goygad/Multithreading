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
        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print(infinityThread.isExecuting)
        sleep(5)
        
        if infinityThread.counter == 5 {
            infinityThread.cancel()
        }
        sleep(2)
        
        print(infinityThread.isFinished)
        
        
        
        class InfinityLoop: Thread {
            var counter = 0
            
            override func main() {
                while counter < 30 && !isCancelled {
                    counter += 1
                    print(counter)
                    InfinityLoop.sleep(forTimeInterval: 1)
                }
            }
        }
        
    }
}
