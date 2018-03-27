//
//  RoundButton.swift
//  Calculator iOS11
//
//  Created by Bilal on 2018-02-26.
//  Copyright © 2018 Bilal Kamal Co. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false{
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
       
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }

}
