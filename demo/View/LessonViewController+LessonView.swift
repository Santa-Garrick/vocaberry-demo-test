//
//  LessonViewController+LessonView.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


extension LessonViewController: LessonView {
   func displayLesson(_ lesson: Lesson) {
      self.lesson = lesson
      header.configure(for: lesson)
      
      let label = UILabel()
      label.text = lesson.title
      
      navigationItem.titleView = label
      titleView = label
      
      tableView.reloadData()
   }
   
   func setResult(_ result: Exercise.Result, forExerciseAtIndex index: Int) {
      self.lesson?.exercises[index].result = result
      self.tableView.reloadData()
      self.tableView.selectRow(at: IndexPath(row: index + 1, section: 0),
                               animated: false,
                               scrollPosition: .none)
   }
   
   func showAlert(title: String, message: String) {
      let ac = UIAlertController(title: title,
                                 message: message,
                                 preferredStyle: .alert)
      let ok = UIAlertAction(title: "Ok", style: .default)
      ac.addAction(ok)
      self.present(ac, animated: true, completion: nil)
   }
   
}
