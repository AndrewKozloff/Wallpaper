//
//  PhotosModuleOutput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

enum PhotosOutputState {
	case next
}

protocol PhotosModuleOutput: class {
	func finish(module: PhotosModuleInput, with state: PhotosOutputState)
}