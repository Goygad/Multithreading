//
//  ViewController.swift
//  Multithreading
//
//  Created by Balik on 18.03.2024.
//

import UIKit

class TaskOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in (0..<10) {
             let currentThread = Thread.detachNewThread
            print("1, Current thread: \(String(describing: currentThread))")
          }

          for _ in (0..<10) {
             let currentThread = Thread.current
             print("2, Current thread: \(currentThread)")
          }
    }
}

