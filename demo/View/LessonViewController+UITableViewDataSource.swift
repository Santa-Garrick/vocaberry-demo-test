//
//  LessonViewController+UITableViewDataSource.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


extension LessonViewController: UITableViewDataSource {
   
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      lesson?.exercises.count ?? 0
   }
   
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let row = indexPath.row
      guard let lesson = lesson else { return UITableViewCell() }
      let exercise = lesson.exercises[row]
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as? ExerciseCell else { return UITableViewCell() }
      cell.configure(with: exercise)
      cell.tag = row
      cell.backgroundColor = .clear
      
      cell.playVideoTapped = { [weak self] cell in
         guard let self = self else { return }
         self.presenter.videoButtonTapped(forExerciseAtIndex: cell.tag)
      }
      if row == 0 {
         cell.configureAsTop()
      } else if row == lesson.exercises.count - 1 {
         cell.configureAsBottom()
      } else {
         cell.configureAsMid()
      }
      
      return cell
   }
}
