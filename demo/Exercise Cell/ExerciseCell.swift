//
//  ExerciseCell.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


class ExerciseCell: UITableViewCell {
   // MARK: Subviews
   let titleLabel = UILabel()
   let durationLabel = UILabel()
   let resultLabel = UILabel()
   let descriptionLabel = UILabel()
   let circleView = UIImageView()
   let playVideoButton = UIButton(type: .system)
   var topDotView = DottedVertical()
   var bottomDotView = DottedVertical()
      
   var playVideoTapped: ((ExerciseCell) -> Void)?
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      commonInit()
   }
   
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   @objc func videoPlayTapped() {
      playVideoTapped?(self)
   }
   
   func commonInit() {
      contentView.addSubview(titleLabel)
      contentView.addSubview(descriptionLabel)
      contentView.addSubview(durationLabel)
      contentView.addSubview(resultLabel)

      contentView.addSubview(topDotView)
      contentView.addSubview(circleView)
      contentView.addSubview(bottomDotView)
      
      contentView.addSubview(playVideoButton)

      playVideoButton.addTarget(self, action: #selector(videoPlayTapped), for: .touchUpInside)
      
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
      topDotView.translatesAutoresizingMaskIntoConstraints = false
      circleView.translatesAutoresizingMaskIntoConstraints = false
      bottomDotView.translatesAutoresizingMaskIntoConstraints = false
      playVideoButton.translatesAutoresizingMaskIntoConstraints = false
      durationLabel.translatesAutoresizingMaskIntoConstraints = false
      resultLabel.translatesAutoresizingMaskIntoConstraints = false

      titleLabel.textColor = .white
      titleLabel.font = UIFont.systemFont(ofSize: 16)
      descriptionLabel.textColor = .gray
      descriptionLabel.font = UIFont.systemFont(ofSize: 12)
      durationLabel.font = UIFont.systemFont(ofSize: 14)
      resultLabel.font = UIFont.systemFont(ofSize: 14)

      durationLabel.textColor = .gray
      resultLabel.textColor = #colorLiteral(red: 0.9529411765, green: 0.8156862745, blue: 0.3294117647, alpha: 1)
      
      descriptionLabel.numberOfLines = 0
      
      topDotView.backgroundColor = .clear
      circleView.backgroundColor = .clear
      bottomDotView.backgroundColor = .clear
      
      playVideoButton.setImage(UIImage(systemName: "play"), for: .normal)
      playVideoButton.setImage(UIImage(systemName: "play"), for: .highlighted)
      playVideoButton.tintColor = .white
      playVideoButton.isHidden = true
      
      let constraintsToACtivate = [
         topDotView.topAnchor.constraint(equalTo: contentView.topAnchor),
         topDotView.heightAnchor.constraint(equalToConstant: 14),
         topDotView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
         topDotView.bottomAnchor.constraint(equalTo: circleView.topAnchor),
         topDotView.widthAnchor.constraint(equalToConstant: 2),
         
         circleView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
         circleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                             constant: 18),
         circleView.widthAnchor.constraint(equalToConstant: 20),
         circleView.heightAnchor.constraint(equalToConstant: 20),
         
         bottomDotView.topAnchor.constraint(equalTo: circleView.bottomAnchor),
         bottomDotView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
         bottomDotView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         bottomDotView.widthAnchor.constraint(equalToConstant: 2),
         
         titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                         constant: 15),
         titleLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor,
                                             constant: 18),
         titleLabel.heightAnchor.constraint(equalToConstant: 18),
         
         durationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         durationLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
         
         resultLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
         resultLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
      
         playVideoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
         playVideoButton.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 18),
         playVideoButton.heightAnchor.constraint(equalToConstant: 18),
         
         descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
         descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
         descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56)
      ]
      NSLayoutConstraint.activate(constraintsToACtivate)
   }

   func configure(with exercise: ExerciseViewModel) {
         
      titleLabel.text = exercise.title
      descriptionLabel.text = exercise.description
      durationLabel.text = exercise.durationString
      resultLabel.text = exercise.resultString

      let incompletedImage = UIImage(systemName: "circle")
      let completedImage = UIImage(systemName: "checkmark")

      if exercise.completed {
         circleView.image = completedImage
         circleView.tintColor = #colorLiteral(red: 0.9529411765, green: 0.8156862745, blue: 0.3294117647, alpha: 1)
         durationLabel.isHidden = true
         resultLabel.isHidden = false
      } else {
         circleView.image = incompletedImage
         circleView.tintColor = .gray
         durationLabel.isHidden = false
         resultLabel.isHidden = true
      }
      
      playVideoButton.setTitle("  " + exercise.title, for: .normal)
      playVideoButton.setTitle("  " + exercise.title, for: .highlighted)

      if exercise.hasVideo {
         titleLabel.isHidden = true
         playVideoButton.isHidden = false
      } else {
         titleLabel.isHidden = false
         playVideoButton.isHidden = true
      }
   }
   
   override func prepareForReuse() {
      super.prepareForReuse()
      topDotView.setNeedsDisplay()
      bottomDotView.setNeedsDisplay()
   }
}

extension ExerciseCell {
   func configureAsTop() {
      topDotView.isHidden = true
      bottomDotView.isHidden = false
   }
   func configureAsMid() {
      topDotView.isHidden = false
      bottomDotView.isHidden = false
   }
   func configureAsBottom() {
      topDotView.isHidden = false
      bottomDotView.isHidden = true
   }
}
