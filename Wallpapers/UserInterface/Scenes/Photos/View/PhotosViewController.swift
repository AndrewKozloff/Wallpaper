//
//  PhotosViewController.swift
//  Wallpapers
//
//  Created by Andrew Kozlov on 06/05/2021.
//  Copyright © 2021 Wallpapers. All rights reserved.
//

import UIKit

final class PhotosViewController: UIViewController, PhotosViewInput {

    // MARK: - Properties

    var output: PhotosViewOutput!

    // MARK: - UIViewController
	
	private lazy var collectionLayout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 0
		layout.minimumLineSpacing = 0
		return layout
	}()
	
	private lazy var collectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
		collection.backgroundColor = .white
		collection.delegate = self
		collection.dataSource = self
		collection.showsVerticalScrollIndicator = false
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.register(cell: PhotoCollectionViewCell.self)
		return collection
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - PhotosViewInput
	
	var state: PhotosViewState = .initial {
		didSet {
			switch state {
			case .initial:
				showInitialState()
			case .loading:
				showLoadingState()
			case .success:
				showSuccessState()
			case .failure:
				showFailureState()
			}
		}
	}

	private func showInitialState() {
		view.backgroundColor = .white
		title = "Photos"
		view.addSubview(collectionView)
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
			collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	private func showLoadingState() {
		view.showActivity()
	}
	
	private func showSuccessState() {
		view.hideActivity()
		collectionView.reloadData()
	}
	
	private func showFailureState() {
		view.hideActivity()
	}

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let width = (collectionView.bounds.size.width) / 3
		let height = width
		return CGSize(width: width, height: height)
	}
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		output.didSelectCategory(at: indexPath)
	}
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		output.numberOfSections
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		output.numberOfItems(in: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: PhotoCollectionViewCell = collectionView.dequeueCell(for: indexPath)
		cell.fill(with: output.photoForItem(at: indexPath))
		return cell
	}
}
