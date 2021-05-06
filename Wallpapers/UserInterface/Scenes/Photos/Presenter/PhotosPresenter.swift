//
//  PhotosPresenter.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import Foundation

final class PhotosPresenter: PhotosViewOutput, PhotosModuleInput {

    // MARK: - Properties

    weak var output: PhotosModuleOutput?

    weak var view: PhotosViewInput?
	
	private let albumId: Int
	
	private let service: JSONPlaceholderService = JSONPlaceholderService()

	private var photos: [PhotoCellModel] = []
	
	init(albumId: Int) {
		self.albumId = albumId
	}

    // MARK: - PhotosViewOutput

    func viewLoaded() {
		view?.state = .initial
		loadPhotos()
    }
	
	var numberOfSections: Int {
		1
	}
	
	func numberOfItems(in section: Int) -> Int {
		photos.count
	}
	
	func photoForItem(at indexPath: IndexPath) -> PhotoCellModel {
		photos[indexPath.row]
	}
 
	func didSelectCategory(at indexPath: IndexPath) {
		output?.finish(module: self, with: .next)
	}	

    // MARK: - Private Methods

	private func loadPhotos() {
		view?.state = .loading
		service.getPhotosForAlbum(byId: albumId) { [weak self] (result) in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.photos = response.map {
					PhotoCellModel(imageUrlPath: $0.url)
				}
				self.view?.state = .success
			case .failure(let error):
				print(error)
				self.view?.state = .failure
			}
		}
	}
}
