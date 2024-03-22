//
//  TaskNineViewController.swift
//  Multithreading
//
//  Created by Balik on 22.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    var priority: DispatchQoS.QoSClass { get }
    var completionBlock: (() -> Void)? { get }
    var isFinished: Bool { get }
    var isExecuting: Bool { get }
    func start()
}

class RMOperation: RMOperationProtocol {
    
    var priority: DispatchQoS.QoSClass = .unspecified
    var completionBlock: (() -> Void)?
    var isExecuting = false
    var isFinished = false
    
    func start() {
        DispatchQueue.global(qos: priority).async {
            self.completionBlock?()
        }
    }
}

class TaskNineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let operationFirst = RMOperation()
        let operationSecond = RMOperation()
        
        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        
        operationFirst.start()
        operationSecond.priority = .background
        operationSecond.completionBlock = {
            
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
    }
}
