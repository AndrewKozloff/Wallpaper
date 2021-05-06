//
//  PhotosViewInput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

enum PhotosViewState {
	case initial
	case loading
	case success
	case failure
}

protocol PhotosViewInput: class {
	var state: PhotosViewState { get set }
}
