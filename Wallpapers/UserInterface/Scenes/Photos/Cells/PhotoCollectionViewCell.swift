//
//  PhotoCollectionViewCell.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
	
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.backgroundColor = .white
		
		contentView.addSubview(imageView)
		
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
			imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
			imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		imageView.image = nil
	}
	
	func fill(with model: PhotoCellModel) {
		imageView.kf.indicatorType = .activity
		imageView.kf.setImage(with: URL(string: model.imageUrlPath))
	}
}
