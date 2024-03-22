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
        
        let phrasesService = PhrasesService()
        
        DispatchQueue.global().async {
            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }
        Thread.sleep(forTimeInterval: 1)
        
        DispatchQueue.global().async {
        }
    }
    
    actor PhrasesService {
        var phrases: [String] = []
        let semaphore = DispatchSemaphore(value: 1)
        
        func addPhrase(_ phrase: String)  {
            semaphore.wait()
            phrases.append(phrase)
            semaphore.signal()
        }
    }
}

