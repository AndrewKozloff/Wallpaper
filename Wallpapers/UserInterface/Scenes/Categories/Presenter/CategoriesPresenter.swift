//
//  CategoriesPresenter.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

final class CategoriesPresenter: CategoriesViewOutput, CategoriesModuleInput {

    // MARK: - Properties

    weak var output: CategoriesModuleOutput?

    weak var view: CategoriesViewInput?

    // MARK: - CategoriesViewOutput

    func viewLoaded() {
        view?.setupInitialState()
    }

    // MARK: - CategoriesModuleInput

}
