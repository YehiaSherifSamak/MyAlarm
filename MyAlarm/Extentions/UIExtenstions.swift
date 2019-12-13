//
//  UIExtenstions.swift
//  MyAlarm
//
//  Created by Yehia Samak on 12/7/19.
//  Copyright © 2019 Yehia Samak. All rights reserved.
//

import UIKit

extension UISegmentedControl{
    func changeTextColor(color: UIColor = UIColor.white){
          let titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
                 self.setTitleTextAttributes(titleTextAttributes, for: .normal)
                 self.setTitleTextAttributes(titleTextAttributes, for: .selected)
      }
}

extension  UIButton
{
    func roundButtonDesign()
    {
        self.layer.cornerRadius = self.frame.height/6
        self.layer.shadowColor = UIColor.darkGray.cgColor;
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowOffset = CGSize(width: 0, height: 0);
    }
    func OneSideroundButtonDesign(left: Bool)
    {
        let corners : [UIRectCorner]  = (left) ? [UIRectCorner.topLeft, UIRectCorner.bottomLeft] : [UIRectCorner.topRight, UIRectCorner.bottomRight];
        
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: [corners[0], corners[1]],
                                     cornerRadii: CGSize(width: self.frame.height/2, height: self.frame.height/2) )
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
        
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}


extension UITextField{
    func roundDesign()
       {
           self.layer.cornerRadius = self.frame.height/12
           self.layer.shadowColor = UIColor.darkGray.cgColor;
           self.layer.shadowRadius = 1;
           self.layer.shadowOpacity = 0.3;
           self.layer.shadowOffset = CGSize(width: 0, height: 0);
       }
}


