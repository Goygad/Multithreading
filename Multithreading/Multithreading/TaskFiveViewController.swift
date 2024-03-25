//
//  TaskFourViewController.swift
//  Multithreading
//
//  Created by Balik on 19.03.2024.
//

import UIKit


 class TaskFiveViewController: UIViewController {
    
    var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            print(await fetchMessages())
        }
    }
    
    func fetchMessages() async -> [Message] {
        await withCheckedContinuation { continutaion in
            networkService.fetchMessages { messages in
                continutaion.resume(returning: messages)
            }
        }
    }
}

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}

class NetworkService {
    
    func fetchMessages(completion: @escaping ([Message]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}
