//
//  MenuCollectionViewCell.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import Foundation
import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "MenuCollectionViewCell"
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20.0)
        label.textColor = .label

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setupCell(menu: String) {
        titleLabel.text = menu
        setupViews()
    }
}

private extension MenuCollectionViewCell {
    func setupViews() {
        [
            titleLabel
        ]
            .forEach {
                contentView.addSubview($0)
            }

        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
