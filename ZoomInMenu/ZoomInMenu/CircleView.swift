//
//  CircleView.swift
//  ZoomInMenu
//
//  Created by vikram singh rajpoot on 04/03/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let value = min(self.frame.size.width, self.frame.size.height)
            layer.cornerRadius = value / 2
            layer.masksToBounds = value > 0
        }
    }
}


@IBDesignable
class CircleButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let value = min(self.frame.size.width, self.frame.size.height)
            layer.cornerRadius = value / 2
            layer.masksToBounds = value > 0
        }
    }
}
