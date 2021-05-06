//
//  UICollectionView+Reuse.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

extension UICollectionViewCell {
	static var reuseID: String {
		String(describing: Self.self)
	}
}

extension UICollectionView {
	func register(cell: UICollectionViewCell.Type) {
		register(cell, forCellWithReuseIdentifier: cell.reuseID)
	}
	
	func dequeueCell<CellType: UICollectionViewCell>(for indexPath: IndexPath) -> CellType {
		return dequeueReusableCell(withReuseIdentifier: CellType.reuseID, for: indexPath) as! CellType
	}
}

