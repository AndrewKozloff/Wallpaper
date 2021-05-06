//
//  UIView+Extensions.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

extension UIView {
	@discardableResult
	func rounded(_ corners: UIRectCorner = .allCorners, radius: CGFloat) -> Self {
		var cornerMasks = CACornerMask()
		if corners.contains(.allCorners) {
			cornerMasks.insert(.layerMinXMinYCorner)
			cornerMasks.insert(.layerMaxXMinYCorner)
			cornerMasks.insert(.layerMinXMaxYCorner)
			cornerMasks.insert(.layerMaxXMaxYCorner)
		}
		if corners.contains(.topLeft) {
			cornerMasks.insert(.layerMinXMinYCorner)
		}
		if corners.contains(.topRight) {
			cornerMasks.insert(.layerMaxXMinYCorner)
		}
		if corners.contains(.bottomLeft) {
			cornerMasks.insert(.layerMinXMaxYCorner)
		}
		if corners.contains(.bottomRight) {
			cornerMasks.insert(.layerMaxXMaxYCorner)
		}

		layer.maskedCorners = cornerMasks
		layer.cornerRadius = radius
		return self
	}
	
	@discardableResult
	func backgroundColor(_ color: UIColor?) -> Self {
		backgroundColor = color
		return self
	}
	
	@discardableResult
	func tintColor(_ color: UIColor?) -> Self {
		tintColor = color
		return self
	}
	
	@discardableResult
	func alpha(_ alpha: CGFloat) -> Self {
		self.alpha = alpha
		return self
	}
	
	@discardableResult
	func addShadow(color: UIColor = .black, opacity: Float = 0.4, offset: CGSize = CGSize(width: 0, height: 20), radius: CGFloat = 10) -> UIView {
		layer.shadowColor = color.cgColor
		layer.shadowOpacity = opacity
		layer.shadowOffset = offset
		layer.shadowRadius = radius
		return self
	}
}

extension UIView {
	func addSubviews(_ views: UIView...) {
		views.forEach(addSubview)
	}
}

extension UIView {
	
	func animateLayer<Value>(_ keyPath: WritableKeyPath<CALayer, Value>, to value: Value, duration: CFTimeInterval) {
		let keyString = NSExpression(forKeyPath: keyPath).keyPath
		let animation = CABasicAnimation(keyPath: keyString)
		animation.fromValue = self.layer[keyPath: keyPath]
		animation.toValue = value
		animation.duration = duration
		self.layer.add(animation, forKey: animation.keyPath)
		var thelayer = layer
		thelayer[keyPath: keyPath] = value
	}
}
