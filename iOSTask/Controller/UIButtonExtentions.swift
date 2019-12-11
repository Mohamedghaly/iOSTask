//
//  UIButtonExtentions.swift
//  New_Gen
//
//  Created by Admin on 5/31/18.
//  Copyright © 2018 Minds. All rights reserved.
//

import Foundation
extension UIButton {
    
    
    
    func underline() {
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text!)!)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: (self.titleLabel?.text!.count)!))
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    func selectedButton(title:String, iconName: String, widthConstraints: NSLayoutConstraint){
        self.backgroundColor = UIColor(red: 0, green: 118/255, blue: 254/255, alpha: 1)
        self.setTitle(title, for: .normal)
        self.setTitle(title, for: .highlighted)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitleColor(UIColor.white, for: .highlighted)
        self.setImage(UIImage(named: iconName), for: .normal)
        self.setImage(UIImage(named: iconName), for: .highlighted)
        let textWidth = self.titleLabel!.frame.width//(title as NSString).size(attributes:[ NSFontAttributeName:self.titleLabel!.font!]).width
        let width = textWidth + 10 + 24
        //24 - the sum of your insets from left and right
        widthConstraints.constant = width
        self.layoutIfNeeded()
    }
    
    func setButtonRoundedCorner(cornerRadius: CGFloat, borderWidth: CGFloat = 0,borderColor: CGColor = UIColor.clear.cgColor) {
        
        // self.backgroundColor = backGround
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        
    }
}


import UIKit

@IBDesignable class CustomButton: UIButton {
    
    @IBInspectable var totallyRoundedCorner : Bool = false {
        didSet {
            
            self.layer.cornerRadius = self.frame.height/2
        }
    }
    
    @IBInspectable var roundedCorner : CGFloat = 0 {
        didSet {
            
            self.layer.cornerRadius = roundedCorner
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}

