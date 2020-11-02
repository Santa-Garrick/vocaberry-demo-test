//
//  Difficulty.swift
//  demo
//
//  Created by Николай Красиков on 01.11.2020.
//

import UIKit


class Difficulty {
   static var maxLevel: Int = 5
   static func color(forLevel level: Int) -> UIColor {
      switch level {
      case 1:
         return UIColor.green

      case 2:
         return UIColor.yellow

      case 3:
         return UIColor.systemPink

      case 4:
         return UIColor.red

      case 5:
         return UIColor.purple

      default:
         return UIColor.purple
      }
   }
   static func text(forLevel level: Int) -> String {
      switch level {
      case 1:
         return "Очень легко"

      case 2:
         return "Легко"

      case 3:
         return "Средне"

      case 4:
         return "Сложно"

      case 5:
         return "Очень сложно"

      default:
         return ""
      }
   }
}
