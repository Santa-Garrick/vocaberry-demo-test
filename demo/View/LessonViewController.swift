//
//  LessonViewController.swift
//  demo
//
//  Created by Николай Красиков on 1.11.2020.
//


import UIKit


extension Lesson: HeaderViewModel {
   
}


class LessonViewController: UIViewController {
   
   var presenter: LessonPresenting = FakeLessonPresenter()
   var lesson: Lesson?

   @IBOutlet weak var tableView: UITableView!
   lazy var header: HeaderView = {
      let header = HeaderView()
      header.backgroundColor = #colorLiteral(red: 0.1183542237, green: 0.1183542237, blue: 0.1183542237, alpha: 1)
      header.layer.cornerRadius = 12
      return header
   }()
   var titleView: UILabel!
   lazy var playButton: UIButton = {
      let playButton = UIButton(type: .system)
      playButton.addTarget(self,
                           action: #selector(playExerciseTapped),
                           for: .touchUpInside)
      playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
      playButton.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.3450980392, blue: 0.8235294118, alpha: 1)
      playButton.tintColor = .white
      playButton.layer.cornerRadius = 28
      return playButton
   }()
   
   @objc func playExerciseTapped() {
      guard let selectedIndex = tableView.indexPathForSelectedRow?.row else { return }
      presenter.playButtonTapped(forExerciseAtIndex: selectedIndex)
   }
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = #colorLiteral(red: 0.05729204416, green: 0.05729204416, blue: 0.05729204416, alpha: 1)
      
      playButton.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(playButton)
      NSLayoutConstraint.activate([
         playButton.heightAnchor.constraint(equalToConstant: 56),
         playButton.widthAnchor.constraint(equalToConstant: 56),
         playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
      ])
      
      setupTableView()
      navigationItem.titleView = titleView
      
      presenter.view = self
      presenter.getLesson()
   }
   
   func setupTableView() {
      tableView.separatorStyle = .none
      tableView.backgroundColor = .clear
      tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
      tableView.register(ExerciseCell.self,
                         forCellReuseIdentifier: "ExerciseCell")
//      tableView.rowHeight = UITableView.automaticDimension
//      tableView.estimatedRowHeight = 45
      
   }
   
}

