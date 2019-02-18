//
//  UIView.swift
//  Lifehacks
//
//  Created by Matteo Manferdini on 26/01/2018.
//  Copyright © 2018 Matteo Manferdini. All rights reserved.
//

import UIKit

@IBDesignable class RoundView: UIView {}
@IBDesignable class RoundButton: UIButton {}

extension UIView {
	@IBInspectable
	var cornerRadius: CGFloat {
		get { return layer.cornerRadius }
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
}
