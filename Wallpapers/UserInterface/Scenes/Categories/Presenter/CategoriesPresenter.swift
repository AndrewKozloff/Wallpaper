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
	
	private let service: JSONPlaceholderService = JSONPlaceholderService()
	
	private var categories: [CategoryCellModel] = []

    // MARK: - CategoriesViewOutput
	
    func viewLoaded() {
		view?.state = .initial
		loadAlbums()
    }
	
	var numberOfSections: Int {
		1
	}
	
	func numberOfItems(in section: Int) -> Int {
		categories.count
	}
	
	func categoryForItem(at indexPath: IndexPath) -> CategoryCellModel {
		categories[indexPath.row]
	}
 
	func didSelectCategory(at indexPath: IndexPath) {
		output?.finish(module: self, with: .category(id: categories[indexPath.row].id))
	}	
	
	// MARK: - Private methods
	
	private func loadAlbums() {
		view?.state = .loading
		service.getAlbums { [weak self] (result) in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.categories = response.map {
					CategoryCellModel(id: $0.id, name: $0.title)
				}
				self.view?.state = .success
			case .failure(let error):
				print(error)
				self.view?.state = .failure
			}
		}
	}

}
