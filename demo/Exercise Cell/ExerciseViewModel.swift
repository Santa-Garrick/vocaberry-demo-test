//
//  ExerciseViewModel.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import Foundation


protocol ExerciseViewModel {
   var title: String { get }
   var description: String { get }
   var completed: Bool { get }
   var hasVideo: Bool { get }
   var durationString: String { get }
   var resultString: String { get }
}


extension Exercise: ExerciseViewModel {
   var durationString: String {
      let formatter = DateComponentsFormatter.shortMinSecFormatter

      let formattedString = formatter.string(from: TimeInterval(duration))!
      
      return formattedString.split(separator: ",").joined()
   }
   
   var completed: Bool { return result != nil }
   
   var resultString: String {
      guard let res = result else { return "empty" }
      return "\(Int((min(res.notes, res.tempo) * 100).rounded()))%"
   }
}
