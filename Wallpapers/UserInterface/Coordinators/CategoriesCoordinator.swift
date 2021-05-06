//
//  CategoriesCoordinator.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

enum CategoriesCoordinatorOutputState {
	case finish
	case exit
}

protocol CategoriesCoordinatorOutput: class {
	func finish(coordinator: CategoriesCoordinator, state: CategoriesCoordinatorOutputState)
}

class CategoriesCoordinator: Coordinator {
	
	var childCoordinators: [Coordinator] = []
	
	weak var output: CategoriesCoordinatorOutput?

	private let navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		showCategories()
	}
}

// MARK: - CategoriesModuleOutput

extension CategoriesCoordinator: CategoriesModuleOutput {
	
	func showCategories() {
		let (view, _) = CategoriesModuleConfigurator().configure(output: self)
		navigationController.pushViewController(view, animated: true)
	}
	
	func finish(module: CategoriesModuleInput, with state: CategoriesOutputState) {
		switch state {
		case .category(let id):
			showCategories(with: id)
		}
	}
}

// MARK: - PhotosModuleOutput

extension CategoriesCoordinator: PhotosModuleOutput {
	
	func showCategories(with id: Int) {
		let (view, _) = PhotosModuleConfigurator().configure(output: self, albumId: id)
		navigationController.pushViewController(view, animated: true)
	}
	
	func finish(module: PhotosModuleInput, with state: PhotosOutputState) {
		switch state {
		case .next:
			break
		}
	}
}
