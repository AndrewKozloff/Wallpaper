//
//  MainCoordinator.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

enum MainCoordinatorOutputState {
	case finish
	case exit
}

protocol MainCoordinatorOutput: class {
	func finish(coordinator: MainCoordinator, state: MainCoordinatorOutputState)
}

class MainCoordinator: NSObject, Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	weak var output: MainCoordinatorOutput?

	private let tabBarController: MainTabBarController

	init(tabBarController: MainTabBarController) {
		self.tabBarController = tabBarController
		super.init()
		tabBarController.delegate = self
	}
	
	func start() {
		performCategoriesFlow()
	}
}

// MARK: - UITabBarControllerDelegate

extension MainCoordinator: UITabBarControllerDelegate {
	
	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
		guard let tab = MainTabItem(rawValue: viewController.tabBarItem.tag) else { return }
		switch tab {
		case .categories:
			performCategoriesFlow()
		case .settings:
			performSettingsFlow()
		}
	}
}

// MARK: - CategoriesCoordinatorOutput

extension MainCoordinator: CategoriesCoordinatorOutput {
	
	func performCategoriesFlow() {
		let navigationController = tabBarController.navigationController(of: .categories)
		guard navigationController.viewControllers.isEmpty else { return }
		let coordinator = CategoriesCoordinator(navigationController: navigationController)
		coordinator.output = self
		addDependency(coordinator)
		coordinator.start()
	}
	
	func finish(coordinator: CategoriesCoordinator, state: CategoriesCoordinatorOutputState) {
		removeDependency(coordinator)
		start()
	}
}

// MARK: - SettingsCoordinatorOutput

extension MainCoordinator: SettingsCoordinatorOutput {
	
	func performSettingsFlow() {
		let navigationController = tabBarController.navigationController(of: .settings)
		guard navigationController.viewControllers.isEmpty else { return }
		let coordinator = SettingsCoordinator(navigationController: navigationController)
		coordinator.output = self
		addDependency(coordinator)
		coordinator.start()
	}
	
	func finish(coordinator: SettingsCoordinator, state: SettingsCoordinatorOutputState) {
		removeDependency(coordinator)
		start()
	}
}
