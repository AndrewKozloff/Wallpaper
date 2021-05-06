//
//  Coordinator.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

protocol Coordinator: class {
	var childCoordinators: [Coordinator] { get set }
	func addDependency(_ coordinator: Coordinator)
	func removeDependency(_ coordinator: Coordinator?)
	
	func start()
}

extension Coordinator {
		
	func addDependency(_ coordinator: Coordinator) {
		guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
		childCoordinators.append(coordinator)
	}

	func removeDependency(_ coordinator: Coordinator?) {
		childCoordinators.removeAll(where: { $0 === coordinator })
	}
}
