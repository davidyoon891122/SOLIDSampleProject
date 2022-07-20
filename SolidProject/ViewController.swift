//
//  ViewController.swift
//  SolidProject
//
//  Created by iMac on 2022/07/20.
//

import UIKit

class ViewController: UIViewController {
    private lazy var OCPCallButton: UIButton = {
        let button = UIButton()
        button.setTitle("OCPButton", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.cornerRadius = 13.0

        button.backgroundColor = .secondarySystemBackground

        button.addTarget(
            self,
            action: #selector(callButtonAction),
            for: .touchUpInside
        )

        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 10,
                bottom: 10,
                trailing: 10
            )
            button.configuration = config
        } else {
            button.contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
            button.sizeToFit()
        }

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var SRPSaveButton: UIButton = {
        let button = UIButton()
        button.setTitle("SRPSaveButton", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.cornerRadius = 13.0

        button.backgroundColor = .secondarySystemBackground

        button.addTarget(
            self,
            action: #selector(saveButtonAction),
            for: .touchUpInside
        )

        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 10,
                bottom: 10,
                trailing: 10
            )
            button.configuration = config
        } else {
            button.contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
            button.sizeToFit()
        }

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var SRPLoadButton: UIButton = {
        let button = UIButton()
        button.setTitle("SRPLoadButton", for: .normal)
        button.setTitleColor(.label, for: .normal)

        button.layer.cornerRadius = 13.0

        button.backgroundColor = .secondarySystemBackground

        button.addTarget(
            self,
            action: #selector(loadButtonAction),
            for: .touchUpInside
        )

        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.plain()
            config.contentInsets = NSDirectionalEdgeInsets(
                top: 10,
                leading: 10,
                bottom: 10,
                trailing: 10
            )
            button.configuration = config
        } else {
            button.contentEdgeInsets = UIEdgeInsets(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10
            )
            button.sizeToFit()
        }

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginServiceBadCase = LoginServerBadCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        [
            OCPCallButton,
            SRPSaveButton,
            SRPLoadButton,
        ]
            .forEach {
                view.addSubview($0)
            }

        OCPCallButton.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 16.0
        ).isActive = true

        OCPCallButton.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 16.0
        ).isActive = true


        SRPSaveButton.topAnchor.constraint(
            equalTo: OCPCallButton.bottomAnchor,
            constant: 4.0
        ).isActive = true
        SRPSaveButton.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 16.0
        ).isActive = true

        SRPLoadButton.topAnchor.constraint(equalTo: SRPSaveButton.topAnchor).isActive = true
        SRPLoadButton.leadingAnchor.constraint(
            equalTo: SRPSaveButton.trailingAnchor,
            constant: 4.0
        ).isActive = true

    }

    @objc func callButtonAction() {
        let dog = Dog()
        let cat = Cat()
        dog.makeSound()
        cat.makeSound()
    }

    @objc func saveButtonAction() {
        loginServiceBadCase.login(id: "David", pw: "1234")
    }

    @objc func loadButtonAction() {
        loginServiceBadCase.loadUserInfo()
    }
}
