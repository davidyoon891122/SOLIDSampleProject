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

        button.backgroundColor = .secondarySystemBackground

        button.addTarget(
            self,
            action: #selector(callButtonAction),
            for: .touchUpInside
        )

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        [
            OCPCallButton
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


    }

    @objc func callButtonAction() {
        let dog = Dog()
        let cat = Cat()
        dog.makeSound()
        cat.makeSound()
    }
}
