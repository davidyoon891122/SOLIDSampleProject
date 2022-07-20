//
//  OpenClosedPrinciple.swift
//  SolidProject
//
//  Created by iMac on 2022/07/20.
//

import Foundation

protocol Animal {
    func makeSound()
}

class Dog: Animal {
    func makeSound() {
        print("🐶Dog")
    }
}

class Cat: Animal {
    func makeSound() {
        print("🐱Cat")
    }
}
