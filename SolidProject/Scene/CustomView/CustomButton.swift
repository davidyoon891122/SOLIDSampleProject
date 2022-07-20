//
//  CustomButton.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import UIKit

final class CustomButton:UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomButton {
    func setupButton() {
        setTitleColor(.label, for: .normal)

        layer.cornerRadius = 13.0

        backgroundColor = .secondarySystemBackground

        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 10,
                bottom: 10,
                trailing: 10
            )
            configuration = config
        } else {
            contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
        }
    }
}
