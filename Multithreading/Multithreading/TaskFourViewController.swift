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
        
        var sharedResource = 0
        let lock = NSLock()
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            for _ in 1...100 {
                lock.lock()
                sharedResource += 1
                lock.unlock()
            }
        }
    }
}

// race condition



