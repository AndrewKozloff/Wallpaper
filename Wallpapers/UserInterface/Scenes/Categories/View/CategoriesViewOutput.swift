//
//  CategoriesViewOutput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import Foundation

protocol CategoriesViewOutput {
    /// Notify presenter that view is ready
    func viewLoaded()
	var numberOfSections: Int { get }
	func numberOfItems(in section: Int) -> Int
	func categoryForItem(at indexPath: IndexPath) -> CategoryModel
	func didSelectCategory(at indexPath: IndexPath)
}
