//
//  TaskSixViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit

class TaskSixViewController: UIViewController {
        
        var networkService = NetworkService()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            Task {
                do {
                    print(try await fetchMessages())
                } catch {
                    print(error)
                }
            }
        }
        
        func fetchMessages() async throws -> [Message] {
            try await withCheckedThrowingContinuation { continutaion in
                networkService.fetchMessages { messages in
                    if messages.isEmpty {
                        continutaion.resume(throwing: "Error" as! Error)
                    } else {
                        continutaion.resume(returning: messages)
                    }
                }
            }
        }
    }
