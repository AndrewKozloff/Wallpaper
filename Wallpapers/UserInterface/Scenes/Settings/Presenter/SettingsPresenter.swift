//
//  SettingsPresenter.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

final class SettingsPresenter: SettingsViewOutput, SettingsModuleInput {

    // MARK: - Properties

    weak var output: SettingsModuleOutput?

    weak var view: SettingsViewInput?

    // MARK: - SettingsViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - SettingsModuleInput

}
