//
//  PhotosModuleConfigurator.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class PhotosModuleConfigurator {

    // MARK: - Internal methods

	func configure(output: PhotosModuleOutput, albumId: Int) -> (UIViewController, PhotosModuleInput) {
        let view = PhotosViewController()
		let presenter = PhotosPresenter(albumId: albumId)

        presenter.output = output
        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
