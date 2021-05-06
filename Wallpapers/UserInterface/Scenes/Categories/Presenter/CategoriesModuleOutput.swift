//
//  CategoriesModuleOutput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

enum CategoriesOutputState {
	case category(id: Int)
}

protocol CategoriesModuleOutput: class {
	func finish(module: CategoriesModuleInput, with state: CategoriesOutputState)
}
