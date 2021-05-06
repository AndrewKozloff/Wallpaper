//
//  PhotoModel.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import Foundation

struct PhotoModel: Codable {
	let albumId: Int
	let id: Int
	let title: String
	let url: String
	let thumbnailUrl: String
}
