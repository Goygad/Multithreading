//
//  TaskElevenViewController.swift
//  Multithreading
//
//  Created by Balik on 22.03.2024.
//

import UIKit

class TaskElevenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let threadSafeArray = ThreadSafeArray()
        let operationQueue = OperationQueue()
        
        let firstOperation = FirstOperation(threadSafeArray: threadSafeArray)
        let secondOperation = SecondOperation(threadSafeArray: threadSafeArray)
        
        operationQueue.addOperation(firstOperation)
        secondOperation.addDependency(firstOperation)
        operationQueue.addOperation(secondOperation)
        operationQueue.waitUntilAllOperationsAreFinished()
        
        print(threadSafeArray.getAll())
    }
}

class ThreadSafeArray {
    private var array: [String] = []
    
    func append(_ item: String) {
        array.append(item)
    }
    
    func getAll() -> [String] {
        return array
    }
}

class FirstOperation: Operation {
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Первая операция")
    }
}

class SecondOperation: Operation {
    let threadSafeArray: ThreadSafeArray
    
    init(threadSafeArray: ThreadSafeArray) {
        self.threadSafeArray = threadSafeArray
    }
    
    override func main() {
        if isCancelled { return }
        threadSafeArray.append("Вторая операция")
    }
}

// проблема дата рейса, решается добавлением зависимости
