//
//  LessonPresenter.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import Foundation

protocol LessonView {
   func displayLesson(_ lesson: Lesson)
   func setResult(_ result: Exercise.Result,
                  forExerciseAtIndex index: Int)
   func showAlert(title: String, message: String)
}

protocol LessonPresenting {
   var view: LessonView? { get set }
   func getLesson()
   func videoButtonTapped(forExerciseAtIndex index: Int)
   func playButtonTapped(forExerciseAtIndex index: Int)
}

class FakeLessonPresenter: LessonPresenting {
   var view: LessonView?
   
   func getLesson() {
      view?.displayLesson(FakeLessonFactory.defaults)
   }
   
   func videoButtonTapped(forExerciseAtIndex index: Int) {
      let exercise = FakeLessonFactory.defaults.exercises[index]
      view?.showAlert(title: "Watching video for lesson:",
                      message: exercise.title + " " + exercise.description)
   }
   
   func playButtonTapped(forExerciseAtIndex index: Int) {
      let exercise = FakeLessonFactory.defaults.exercises[index]
      view?.showAlert(title: "Performing exercise for lesson:",
                      message: exercise.title + " " + exercise.description)
      let result = FakeLessonFactory.generateFakeResult()
      view?.setResult(result, forExerciseAtIndex: index)
   }
   
   
}
