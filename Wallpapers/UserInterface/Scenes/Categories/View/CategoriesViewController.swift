//
//  CategoriesViewController.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class CategoriesViewController: UIViewController, CategoriesViewInput {

    // MARK: - Properties

    var output: CategoriesViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - CategoriesViewInput

    func setupInitialState() {

    }

}
