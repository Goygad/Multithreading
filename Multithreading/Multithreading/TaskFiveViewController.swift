//
//  TaskFourViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskFiveViewController: UIViewController {
    
    private var name = "Введите имя"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
        
    }
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    func updateName() {
        lockQueue.async {
            self.name = "I love RM"
            print(Thread.current)
            print(self.name)
        }
        print ("first \(self.name)")
    }
}

// Такой результат в консоли (при DispatchQueue.global().async) - результат непредсказуем, из-за ансинхронности
// Такой результат в консоли (при DispatchQueue.global().sync) - потому что поток, который вызывает updateName(), будет заблокирован до тех пор, пока блок, переданный в sync, не будет выполнен




