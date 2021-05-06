//
//  CategoriesPresenter.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import Foundation

final class CategoriesPresenter: CategoriesViewOutput, CategoriesModuleInput {

    // MARK: - Properties

    weak var output: CategoriesModuleOutput?

    weak var view: CategoriesViewInput?
	
	private var categories: [CategoryModel] = []

    // MARK: - CategoriesViewOutput
	
    func viewLoaded() {
        view?.setupInitialState()
		categories = (0...100).map { CategoryModel(name: "Category: \($0)", imageUrlPath: "") }
		view?.reloadData()
    }
	
	var numberOfSections: Int {
		1
	}
	
	func numberOfItems(in section: Int) -> Int {
		categories.count
	}
	
	func categoryForItem(at indexPath: IndexPath) -> CategoryModel {
		categories[indexPath.row]
	}
 
	func didSelectCategory(at indexPath: IndexPath) {
		output?.finish(module: self, with: .next)
	}

    // MARK: - CategoriesModuleInput

}
