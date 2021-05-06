//
//  SettingsModuleConfigurator.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class SettingsModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: SettingsModuleOutput) -> (UIViewController, SettingsModuleInput) {
        let view = SettingsViewController()
        let presenter = SettingsPresenter()

        presenter.output = output
        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
