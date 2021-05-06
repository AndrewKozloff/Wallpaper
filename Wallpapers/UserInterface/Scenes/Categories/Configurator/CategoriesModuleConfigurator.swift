//
//  CategoriesModuleConfigurator.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class CategoriesModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: CategoriesModuleOutput) -> (UIViewController, CategoriesModuleInput) {
        let view = CategoriesViewController()
        let presenter = CategoriesPresenter()

        presenter.output = output
        presenter.view = view
        view.output = presenter

        return (view, presenter)
    }

}
