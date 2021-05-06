//
//  MainTabItem.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

enum MainTabItem: Int, CaseIterable {

	case categories
	case settings

	// MARK: - Properties

	var title: String {
		switch self {
		case .categories:
			return "Categories"
		case .settings:
			return "Settings"
		}
	}

	var image: UIImage {
		switch self {
		case .categories:
			return UIImage()
		case .settings:
			return UIImage()
		}
	}

	var selectedImage: UIImage {
		return image
	}
	
	var idendifier: String {
		switch self {
		case .categories:
			return "tab_categories"
		case .settings:
			return "tab_settings"
		}
	}

}
