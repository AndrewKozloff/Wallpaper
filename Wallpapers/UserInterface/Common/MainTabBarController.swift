//
//  MainTabBarController.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
	
	var selectedTab: MainTabItem {
		get {
			MainTabItem(rawValue: selectedIndex)!
		}
		set {
			selectedIndex = newValue.rawValue
		}
	}
		
	init() {
		super.init(nibName: nil, bundle: nil)
		configureControllers()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureDefaultAppearance()
	}
	
	func navigationController(of tab: MainTabItem) -> UINavigationController {
		viewControllers?[tab.rawValue] as! UINavigationController
	}
	
	func configureDefaultAppearance() {
		tabBar.barTintColor = .white
		tabBar.tintColor = .systemRed
		tabBar.unselectedItemTintColor = .systemGray2
		tabBar.shadowImage = UIImage()
	}

	private func configureControllers() {
		var controllers: [UIViewController] = []
		for tab in MainTabItem.allCases {
			let tabBarItem = UITabBarItem(title: tab.title, image: tab.image, selectedImage: tab.selectedImage)
			tabBarItem.tag = tab.rawValue
			tabBarItem.accessibilityIdentifier = tab.idendifier

			let navigationController = UINavigationController()
			navigationController.tabBarItem = tabBarItem
			controllers.append(navigationController)
		}
		viewControllers = controllers
	}
}
