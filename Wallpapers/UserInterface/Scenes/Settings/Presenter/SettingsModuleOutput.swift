//
//  SettingsModuleOutput.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

enum SettingsOutputState {
	case next
}

protocol SettingsModuleOutput: class {
	func finish(module: SettingsModuleInput, with state: SettingsOutputState)
}