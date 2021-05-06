//
//  JSONPlaceholderAPI.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import Moya
import Foundation

enum JSONPlaceholderAPI {
	case albums
	case photos(albumId: Int)
}

extension JSONPlaceholderAPI: TargetType {
	var baseURL: URL {
		URL(string: Constants.baseUrlPath)!
	}
	
	var path: String {
		switch self {
		case .albums:
			return "/albums"
		case .photos:
			return "/photos"
		}
	}
	
	var method: Moya.Method {
		switch self {
		case .albums:
			return .get
		case .photos:
			return .get
		}
	}
	
	var sampleData: Data {
		Data()
	}
	
	var task: Task {
		switch self {
		case .albums:
			return .requestPlain
		case .photos(let albumId):
			return .requestParameters(
				parameters: ["albumId": albumId],
				encoding: URLEncoding.queryString
			)
		}
	}
	
	var headers: [String : String]? {
		nil
	}
}
