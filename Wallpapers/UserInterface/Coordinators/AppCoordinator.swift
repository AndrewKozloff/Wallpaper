//
//  AppCoordinator.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

class AppCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	let window: UIWindow

	init(window: UIWindow) {
		self.window = window
	}
	
	func start() {
		performMainFlow()
		window.makeKeyAndVisible()
	}
}

// MARK: - MainCoordinatorOutput

extension AppCoordinator: MainCoordinatorOutput {
	
	private func performMainFlow() {
		let tabBarController = MainTabBarController()
		window.rootViewController = tabBarController
		let coordinator = MainCoordinator(tabBarController: tabBarController)
		coordinator.output = self
		addDependency(coordinator)
		coordinator.start()
	}
	
	func finish(coordinator: MainCoordinator, state: MainCoordinatorOutputState) {
		removeDependency(coordinator)
		start()
	}
}
