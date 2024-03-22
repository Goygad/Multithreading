//
//  TaskSevenViewController.swift
//  Multithreading
//
//  Created by Balik on 20.03.2024.
//

import UIKit

class TaskSevenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = ArrayAdditionService()
        for i in 1...10 {
            service.addElement(i)
        }
        service.cancelAddition()
    }
    
    class ArrayAdditionService {
        private var array = [Int]()
        private var pendingWorkItems = [DispatchWorkItem]()
        
        func addElement(_ element: Int) {
            let newWorkItem = DispatchWorkItem { [weak self] in
                self?.array.append(element)
                print("Элемент \(element) успешно добавлен в массив.")
            }
            
            pendingWorkItems.append(newWorkItem)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                if newWorkItem.isCancelled == false {
                    print("Done - \(element)")
                }
            }
        }
        
        func cancelAddition() {
            guard let lastWorkItem = pendingWorkItems.last else {
                print("Нет операций для отмены.")
                return
            }
            lastWorkItem.cancel()
        }
    }
}

