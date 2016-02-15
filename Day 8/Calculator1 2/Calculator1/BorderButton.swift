//
//  BorderButton.swift
//  Calculator1
//
//  Created by Mitchell Phillips on 2/10/16.
//  Copyright © 2016 Mitchell Phillips. All rights reserved.
//


import UIKit
import QuartzCore

@IBDesignable
class BorderButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.CGColor
        }
    }
    
}
