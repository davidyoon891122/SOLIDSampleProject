//
//  ViewController.swift
//  SolidProject
//
//  Created by iMac on 2022/07/20.
//

import UIKit

class ViewController: UIViewController {
    private lazy var callButton: UIButton = {
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
            callButton
        ]
            .forEach {
                view.addSubview($0)
            }

        callButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        callButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc func callButtonAction() {
        let dog = Dog()
        let cat = Cat()
        dog.makeSound()
        cat.makeSound()
    }
}
