//
//  LessonViewController+UITableViewDelegate.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


extension LessonViewController: UITableViewDelegate {

   func tableView(_ tableView: UITableView,
                  willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      if tableView.indexPathForSelectedRow == indexPath {
         tableView.deselectRow(at: indexPath, animated: false)
         return nil
      } else {
         return indexPath
      }
   }
   
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
      
      guard let exercise = lesson?.exercises[indexPath.row] else { return 0.0 }
      
      let textWidth = tableView.frame.width - 38 - 18 - 56
      
      let textHeight = exercise.description.height(withConstrainedWidth: textWidth,
                                              font: UIFont.systemFont(ofSize: 12))
      
      let height: CGFloat = 17 + 18 + 4 + 21 + textHeight
      
      let adjusted = CGFloat(Int(height - 16 - 20) / 4 * 4 + 6) + 16 + 20
      return adjusted
      
   }
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      104
   }
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      header
   }
}
