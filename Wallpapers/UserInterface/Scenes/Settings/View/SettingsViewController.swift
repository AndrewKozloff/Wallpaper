//
//  SettingsViewController.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController, SettingsViewInput {

    // MARK: - Properties

    var output: SettingsViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - SettingsViewInput

    func setupInitialState() {
		view.backgroundColor = .systemIndigo
    }

}
