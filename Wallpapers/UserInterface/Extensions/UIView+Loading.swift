//
//  UIView+Loading.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

extension UIView {
	
	static let loadingViewTag = 1938123987
	
	func showActivity(style: UIActivityIndicatorView.Style = .medium) {
		guard viewWithTag(UIView.loadingViewTag) == nil else {
			return
		}
		
		let activityView = UIActivityIndicatorView(style: style)
		activityView.translatesAutoresizingMaskIntoConstraints = false
		activityView.startAnimating()
		activityView.hidesWhenStopped = true
		activityView.tag = UIView.loadingViewTag
		addSubview(activityView)
		activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
	}
	
	func hideActivity() {
		if let activityView = viewWithTag(UIView.loadingViewTag) {
			activityView.removeFromSuperview()
		}
		isUserInteractionEnabled = true
	}
}
