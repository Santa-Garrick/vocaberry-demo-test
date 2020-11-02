//
//  LessonViewController+HeaderCollapsing.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


extension LessonViewController: UIScrollViewDelegate {
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let position = scrollView.contentOffset.y - header.frame.height / 4
      titleView?.alpha = max(0, (min(1, position / 104 * 2)))
      header.alpha = 1.0 - max(0, (min(1, position / 104)))
      
   }
   
}
