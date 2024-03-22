//
//  ViewController.swift
//  MultithreadingLive
//
//  Created by Balik on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let queue = DispatchQueue(label: "Queue", attributes: .concurrent)
        run()
        
        
        func run() {
            
            let item = DispatchWorkItem {
                print(Thread.current)
                print("Task1")
            }
            
            item.notify(queue: .main) {
                print(Thread.current)
                print("finish")
            }
            
//            queue.async {
//                sleep(1)
//                print(Thread.current)
//                
//            }
            
            queue.async(execute: item)
            
//            sleep(2)
//            item.cancel()
        }
    }
    
}

