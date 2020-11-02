//
//  DateComponentsFormatter+shortMinSec.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import Foundation


extension DateComponentsFormatter {
   static var shortMinSecFormatter: DateComponentsFormatter {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.minute, .second]
      formatter.unitsStyle = .short
      return formatter
   }
}
