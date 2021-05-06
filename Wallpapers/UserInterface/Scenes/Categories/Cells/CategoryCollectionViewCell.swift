//
//  CategoryCollectionViewCell.swift
//  Wallpapers
//
//  Created by Андрей Козлов on 06.05.2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
	
	private lazy var gradientLayer = CAGradientLayer()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 12)
		label.textColor = .secondaryLabel
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.backgroundColor(.white)
			.shadowColor(.black)
			.shadowRadius(10)
			.shadowOpacity(0.4)
			.rounded(radius: 12)
		
		gradientLayer.colors = [UIColor.systemGray2.cgColor, UIColor.white.cgColor]
		contentView.layer.addSublayer(gradientLayer)
		
		contentView.addSubviews(
			titleLabel
		)
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		contentView.layer.shadowPath = UIBezierPath(rect: contentView.bounds.offsetBy(dx: 0, dy: 5)).cgPath
		gradientLayer.frame = contentView.bounds
	}
	
	func fill(with model: CategoryCellModel) {
		titleLabel.text = model.name
	}
}
