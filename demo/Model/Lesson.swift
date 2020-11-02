//
//  Lesson.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


struct Lesson {
   let title: String
   let artist: String
   let difficulty: Int
   let image: UIImage
   
   var exercises: [Exercise] = []
}
