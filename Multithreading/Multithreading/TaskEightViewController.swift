//
//  TaskEightViewController.swift
//  Multithreading
//
//  Created by Balik on 20.03.2024.
//

import UIKit

class TaskEightViewController: UIViewController {
    
    final class Post: Sendable {
    }
    
    enum State1: Sendable {
        case loading
        case data(String)
    }
    
    enum State2: Sendable {
        case loading
        case data(Post)
    }
    
}

//Нужно было прописать что Post тоже подписан на Sendable
