//
//  LiskovSubstitutionPrinciple.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import Foundation

class Rectangle {
    var width: Float = 0
    var height: Float = 0

    var area: Float {
        return width * height
    }
}

class Square: Rectangle {
    override var width: Float {
        didSet {
            height = width
        }
    }
}

func printArea(of rectangle: Rectangle) {
    rectangle.height = 3
    rectangle.width = 6
    print(rectangle.area)
}

protocol Shape {
    var area: Float { get }
}

class RectagleNice: Shape {
    let width: Float
    let height: Float

    var area: Float {
        return width * height
    }

    init(
        width: Float,
        height: Float
    ) {
        self.width = width
        self.height = height
    }

}

class SquareNice: Shape {
    let length: Float

    var area: Float {
        return length * length
    }

    init(length: Float) {
        self.length = length
    }
}

func printAreaWithProtocol(of rectangle: Shape) {
    print(rectangle.area)
}
