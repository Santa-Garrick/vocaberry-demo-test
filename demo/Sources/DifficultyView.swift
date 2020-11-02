//
//  DifficultyView.swift
//  demo
//
//  Created by Николай Красиков on 01.11.2020.
//

import UIKit


class GaugeView: UIView {
   var maxLevel: Int = 5
   var level: Int = 1 {
      didSet {
         update()
      }
   }
   override var tintColor: UIColor? {
      didSet {
         update()
      }
   }
   private var shapeLayer = CAShapeLayer()
   
   func update() {
      let start = CGPoint(x: bounds.maxX, y: bounds.midY)
      let endMax = CGPoint(x: bounds.minX, y: bounds.midY)
      
      let x: CGFloat = start.x - ((start.x - endMax.x) * CGFloat(level) / CGFloat(maxLevel))
      let endLevel = CGPoint(x: x, y: bounds.midY)
      
      addDashedLine(fromPoint: start, toPoint: endMax, width: bounds.height, color: .gray, pattern: [2,3])
      addDashedLine(fromPoint: start, toPoint: endLevel, width: bounds.height, color: tintColor ?? .green, pattern: [2,3])
   }
   
   override func layoutSubviews() {
      super.layoutSubviews()
      update()
   }
   
}

extension UIView {
   func addDashedLine(fromPoint start: CGPoint,
                      toPoint end: CGPoint,
                      width: CGFloat,
                      color: UIColor,
                      pattern: [NSNumber]) {
      let line = CAShapeLayer()
      
      let linePath = UIBezierPath()
      linePath.move(to: start)
      linePath.addLine(to: end)
      line.path = linePath.cgPath
      line.strokeColor = color.cgColor
      line.lineWidth = width
      line.lineJoin = CAShapeLayerLineJoin.round
      line.lineDashPattern = pattern
      self.layer.addSublayer(line)
   }
}


class DifficultyView: UIView {
   
   // MARK: Subviews
   let label = UILabel()
   let colorIndicator = GaugeView()
   
   var level: Int = 1 {
      didSet {
         label.text = Difficulty.text(forLevel: level)
         colorIndicator.tintColor = Difficulty.color(forLevel: level)
         colorIndicator.level = level
      }
   }
   var maxLevel: Int = 5 {
      didSet {
         colorIndicator.maxLevel = maxLevel
      }
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      commonInit()
   }
   
   required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
   }
   
   func commonInit() {
      addSubview(colorIndicator)
      colorIndicator.translatesAutoresizingMaskIntoConstraints = false
      addSubview(label)
      label.translatesAutoresizingMaskIntoConstraints = false
      
      label.font = UIFont.systemFont(ofSize: 12, weight: .light)
      label.textColor = .gray
      
      NSLayoutConstraint.activate([
         colorIndicator.heightAnchor.constraint(equalToConstant: 8),
         colorIndicator.widthAnchor.constraint(equalToConstant: 22),
         
         colorIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
         colorIndicator.leadingAnchor.constraint(equalTo: leadingAnchor),
         
         label.centerYAnchor.constraint(equalTo: centerYAnchor),
         label.leadingAnchor.constraint(equalTo: colorIndicator.trailingAnchor,
                                        constant: 8),
      ])
   }
}
