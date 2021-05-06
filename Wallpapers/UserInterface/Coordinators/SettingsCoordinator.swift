//
//  SettingsCoordinator.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

enum SettingsCoordinatorOutputState {
	case finish
	case exit
}

protocol SettingsCoordinatorOutput: class {
	func finish(coordinator: SettingsCoordinator, state: SettingsCoordinatorOutputState)
}

class SettingsCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	weak var output: SettingsCoordinatorOutput?

	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showSettings()
	}
}

// MARK: - SettingsModuleOutput

extension SettingsCoordinator: SettingsModuleOutput {
	
	func showSettings() {
		let (view, _) = SettingsModuleConfigurator().configure(output: self)
		navigationController.pushViewController(view, animated: true)
	}
	
	func finish(module: SettingsModuleInput, with state: SettingsOutputState) {
		
	}
}
