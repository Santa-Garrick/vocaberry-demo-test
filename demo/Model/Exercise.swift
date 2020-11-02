//
//  Exercise.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import Foundation


struct Exercise {
   let title: String
   let description: String
   var hasVideo: Bool = false
      
   var duration: Int = 0
   var result: Result? = nil
   
   struct Result {
      let notes: Double
      let tempo: Double
   }
   
   
}
