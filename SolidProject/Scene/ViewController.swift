//
//  ViewController.swift
//  SolidProject
//
//  Created by iMac on 2022/07/20.
//

import UIKit

class ViewController: UIViewController {
    private lazy var OCPCallButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("OCPButton", for: .normal)

        button.addTarget(
            self,
            action: #selector(callButtonAction),
            for: .touchUpInside
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var SRPSaveButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("SRPSaveButton", for: .normal)

        button.addTarget(
            self,
            action: #selector(saveButtonAction),
            for: .touchUpInside
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var SRPLoadButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("SRPLoadButton", for: .normal)

        button.addTarget(
            self,
            action: #selector(loadButtonAction),
            for: .touchUpInside
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginServiceBadCase = LoginServerBadCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        testFunction()
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

    func testFunction() {
        let reqeustHandler = RequestHandler()
        let decodingHandler = DecodingHandler()
        let databaseHandler = DatabaseHandler()

        let loginServiceNiceCase = LoginServerNiceCase(
            apiHandler: reqeustHandler,
            decodingHandler: decodingHandler,
            dbHandler: databaseHandler
        )

        loginServiceNiceCase.login()
    }
}