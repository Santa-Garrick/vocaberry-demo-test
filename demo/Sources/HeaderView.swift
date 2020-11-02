//
//  HeaderView.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


protocol HeaderViewModel {
   var title: String { get }
   var artist: String { get }
   var image : UIImage { get }
   var difficulty: Int { get }
}

class HeaderView: UIView {
   let titleLabel = UILabel()
   let artistLabel = UILabel()
   let imageView = UIImageView()
   let difficultyView = DifficultyView()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
   }
   
   func commonInit() {
      addSubview(titleLabel)
      addSubview(artistLabel)
      addSubview(imageView)
      addSubview(difficultyView)
      
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      artistLabel.translatesAutoresizingMaskIntoConstraints = false
      imageView.translatesAutoresizingMaskIntoConstraints = false
      difficultyView.translatesAutoresizingMaskIntoConstraints = false

      titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
      titleLabel.textColor = .white
      
      artistLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
      artistLabel.textColor = .gray
      
      imageView.layer.cornerRadius = 36
      imageView.clipsToBounds = true
      
      
      NSLayoutConstraint.activate([
         imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
         imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
         imageView.heightAnchor.constraint(equalToConstant: 72),
         imageView.widthAnchor.constraint(equalToConstant: 72),

         titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 21),
         titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
         
         artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
         artistLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
         
         difficultyView.topAnchor.constraint(equalTo: artistLabel.bottomAnchor,
                                             constant: 10),
         difficultyView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor,
                                                 constant: 16),
         difficultyView.heightAnchor.constraint(equalToConstant: 16),
         
         
      ])
      
      
   }
   
   func configure(for viewModel: HeaderViewModel) {
      titleLabel.text = viewModel.title
      artistLabel.text = viewModel.artist
      
      
      imageView.image = viewModel.image
      difficultyView.level = viewModel.difficulty
      
      print(viewModel.title)
   }
}
