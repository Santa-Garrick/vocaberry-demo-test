//
//  FakeLessonFactory.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


class FakeLessonFactory {
   static func generateFakeResult() -> Exercise.Result {
      
      let randomNotes = Double.random(in: 0.4...1)
      let randomTempo = Double.random(in: 0.4...1)
      
      return Exercise.Result(notes: randomNotes, tempo: randomTempo)
      
   }
   static var defaults: Lesson {
      return Lesson(title: "Love Me Tender",
                    artist: "Elvis Presley",
                    difficulty: 1,
                    image: UIImage(named: "elvis-presley")!,
                    exercises: exercises)
   }
   private static var exercises: [Exercise] {
      let exercises =  [
         Exercise(title: "Куплет", description: "Припев песни в медленном темпе, следует пропевать также как куплет."),
         Exercise(title: "Основные ноты мелодии", description: "Спойте ноты, на которых строится мелодия песни."),
         Exercise(title: "Терция",
                  description: "Самый частый и простой для голоса ход — интервал, который называется терцией.",
                  hasVideo: true),
         Exercise(title: "Шаг в тон", description: "Будьте внимательны — интервал уменьшится и ваш голос будет восприниматься сложнее."),
         Exercise(title: "Куплет", description: "Припев песни в медленном темпе, следует пропевать также как куплет."),
         Exercise(title: "Основные ноты мелодии", description: "Спойте ноты, на которых строится мелодия песни."),
         Exercise(title: "Терция", description: "Самый частый и простой для голоса ход — интервал, который называется терцией."),
         Exercise(title: "Шаг в тон", description: "Будьте внимательны — интервал уменьшится и ваш голос будет восприниматься сложнее."),
         Exercise(title: "Куплет", description: "Припев песни в медленном темпе, следует пропевать также как куплет."),
         Exercise(title: "Основные ноты мелодии", description: "Спойте ноты, на которых строится мелодия песни."),
         Exercise(title: "Терция", description: "Самый частый и простой для голоса ход — интервал, который называется терцией. Самый частый и простой для голоса ход — интервал, который называется терцией. Самый частый и простой для голоса ход — интервал, который называется терцией. Самый частый и простой для голоса ход — интервал, который называется терцией. Самый частый и простой для голоса ход — интервал, который называется терцией."),
         Exercise(title: "Шаг в тон", description: "Будьте внимательны — интервал уменьшится и ваш голос будет восприниматься сложнее."),
         
      ].map{ $0.randomize() }
      return exercises
   }
}

fileprivate extension Exercise {
   
   func randomize() -> Exercise {
      var ex = self
      ex.duration = Int.random(in: 25...150)
      return ex
   }
}
