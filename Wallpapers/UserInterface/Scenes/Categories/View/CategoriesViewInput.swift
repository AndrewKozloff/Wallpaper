//
//  CategoriesViewInput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

enum CategoriesViewState {
	case initial
	case loading
	case success
	case failure
}

protocol CategoriesViewInput: class {
    /// Method for setup initial state of view
	var state: CategoriesViewState { get set }
}
