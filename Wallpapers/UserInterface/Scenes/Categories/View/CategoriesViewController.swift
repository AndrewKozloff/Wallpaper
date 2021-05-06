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

    var output: CategoriesViewOutput!

    // MARK: - UIViewController
	
	private lazy var collectionLayout: UICollectionViewFlowLayout = {
		let layout = UICollectionViewFlowLayout()
		layout.minimumInteritemSpacing = 10
		layout.minimumLineSpacing = 24
		return layout
	}()
	
	private lazy var collectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
		collection.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
		collection.backgroundColor = .white
		collection.delegate = self
		collection.dataSource = self
		collection.showsVerticalScrollIndicator = false
		collection.translatesAutoresizingMaskIntoConstraints = false
		collection.register(cell: CategoryCollectionViewCell.self)
		return collection
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewLoaded()
    }

    // MARK: - CategoriesViewInput

    func setupInitialState() {
		view.backgroundColor = .white
		title = "Categories"
		view.addSubview(collectionView)
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
			collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
			collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
    }
	
	func reloadData() {
		collectionView.reloadData()
	}

}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let padding = collectionView.contentInset.left + collectionView.contentInset.right
		let spacing: CGFloat = 10
 		let width = (collectionView.bounds.size.width - padding - spacing) / 2
		let height = width * 1.5
		return CGSize(width: width, height: height)
	}
}

// MARK: - UICollectionViewDelegate

extension CategoriesViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		output.didSelectCategory(at: indexPath)
	}
}

// MARK: - UICollectionViewDataSource

extension CategoriesViewController: UICollectionViewDataSource {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		output.numberOfSections
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		output.numberOfItems(in: section)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: CategoryCollectionViewCell = collectionView.dequeueCell(for: indexPath)
		cell.fill(with: output.categoryForItem(at: indexPath))
		return cell
	}
}
