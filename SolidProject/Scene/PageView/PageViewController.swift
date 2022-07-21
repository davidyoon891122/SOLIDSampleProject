//
//  PageViewController.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import Foundation
import UIKit

final class PageViewController: UIViewController {
    // MARK: - UI
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width / 2,
            height: 50.0
        )
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            MenuCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuCollectionViewCell.identifier
        )

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Variables
    private let menus: [String] = ["Main", "Sub"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        menuCollectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension PageViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return menus.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuCollectionViewCell.identifier,
            for: indexPath
        ) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        let menu = menus[indexPath.row]
        cell.setupCell(menu: menu)

        return cell
    }
}

extension PageViewController: UICollectionViewDelegateFlowLayout {

}


private extension PageViewController {
    func setupViews() {
        [
            menuCollectionView
        ]
            .forEach {
                view.addSubview($0)
            }

        menuCollectionView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 0.0
        ).isActive = true
        menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    }
}
