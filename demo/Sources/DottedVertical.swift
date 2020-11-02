//
//  DottedVertical.swift
//  demo
//
//  Created by Николай Красиков on 02.11.2020.
//

import UIKit


@IBDesignable class DottedVertical: UIView {
   
   @IBInspectable var dotColor: UIColor = UIColor.gray
   
   override func draw(_ rect: CGRect) {

      let fullHeight = bounds.size.height
      let width = bounds.size.width
      let itemLength = width

      let path = UIBezierPath()

      let beginFromTop = CGFloat(0.0)
      let top = CGPoint(x: width/2, y: beginFromTop)
      let bottom = CGPoint(x: width/2, y: fullHeight)

      path.move(to: top)
      path.addLine(to: bottom)

      path.lineWidth = width

      let dashes: [CGFloat] = [0.0, itemLength * 2.0]
      path.setLineDash(dashes, count: dashes.count, phase: -0.75)

      path.lineCapStyle = CGLineCap.round

      dotColor.setStroke()
      path.stroke()
   }
}
