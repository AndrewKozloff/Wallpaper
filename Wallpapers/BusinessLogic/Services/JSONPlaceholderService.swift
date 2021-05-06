//
//  JSONPlaceholderService.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import Moya

class JSONPlaceholderService {
	
	private let provider = MoyaProvider<JSONPlaceholderAPI>()
	
	func getAlbums(completion: @escaping (Result<[AlbumModel], Error>) -> Void) {
		provider.request(.albums) { (result) in
			completion(
				result.mapError{ $0 }.flatMap { response in Result { try response.filterSuccessfulStatusCodes().map([AlbumModel].self) } }
			)
		}
	}
	
	func getPhotosForAlbum(byId id: Int, completion: @escaping (Result<[PhotoModel], Error>) -> Void) {
		provider.request(.photos(albumId: id)) { (result) in
			completion(
				result.mapError{ $0 }.flatMap { response in Result { try response.filterSuccessfulStatusCodes().map([PhotoModel].self) } }
			)
		}
	}
}
