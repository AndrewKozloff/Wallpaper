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

	var image: UIImage? {
		switch self {
		case .categories:
			return UIImage(systemName: "photo.on.rectangle")
		case .settings:
			return UIImage(systemName: "person.crop.circle")
		}
	}

	var selectedImage: UIImage? {
		switch self {
		case .categories:
			return UIImage(systemName: "photo.on.rectangle.fill")
		case .settings:
			return UIImage(systemName: "person.crop.circle.fill")
		}
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
