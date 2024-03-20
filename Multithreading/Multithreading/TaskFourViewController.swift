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
        
        // Создаем и запускаем поток
        let thread1 = ThreadprintDemon()
        let thread2 = ThreadprintAngel()
        
        // Меняем приоритеты
        thread1.qualityOfService = .background
        thread2.qualityOfService = .userInteractive
        
        thread1.start()
        thread2.start()
        
    }
    
    class ThreadprintDemon: Thread {
        override func main() {
            for _ in (0..<100) {
                print("1🤬")
            }
        }
    }
    class ThreadprintAngel: Thread {
        override func main() {
            for _ in (0..<100) {
                print("2🥶")
            }
        }
    }
}




