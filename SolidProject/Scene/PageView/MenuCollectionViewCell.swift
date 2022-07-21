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
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var underBarView: UIView  = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    func setupCell(menu: String) {
        titleLabel.text = menu
        setupViews()
    }

    override var isSelected: Bool {
        get {
            super.isSelected
        }
        set {
            if newValue {
                titleLabel.textColor = .blue
                underBarView.backgroundColor = .white
            } else {
                titleLabel.textColor = .label
                underBarView.backgroundColor = .black
            }
        }
    }
}

private extension MenuCollectionViewCell {
    func setupViews() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.3
        layer.cornerRadius = 3.0
        [
            titleLabel,
            underBarView
        ]
            .forEach {
                contentView.addSubview($0)
            }

        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: underBarView.topAnchor).isActive = true

        underBarView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        underBarView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        underBarView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        underBarView.heightAnchor.constraint(equalToConstant: 3.0).isActive = true
    }
}
