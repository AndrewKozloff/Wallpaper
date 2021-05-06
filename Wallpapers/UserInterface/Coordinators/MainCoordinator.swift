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

class MainCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	weak var output: MainCoordinatorOutput?

	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		
	}
}
