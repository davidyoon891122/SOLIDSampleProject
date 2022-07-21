//
//  InterfaceSegregationPrinciple.swift
//  SolidProject
//
//  Created by iMac on 2022/07/21.
//

import Foundation

protocol ShapeISP {
    var area: Float { get }
    var length: Float { get }
}

class SquareISP: ShapeISP {
    var width: Float
    var height: Float

    var area: Float {
        width * height
    }

    var length: Float {
        0
    }

    init(
        width: Float,
        height: Float
    ) {
        self.width = width
        self.height = height
    }
}

class LineISP: ShapeISP {
    var pointA: Float
    var pointB: Float

    var area: Float {
        0
    }

    var length: Float {
        pointA - pointB
    }

    init(
        pointA: Float,
        pointB: Float
    ) {
        self.pointA = pointA
        self.pointB = pointB
    }
}

protocol AreaCalculatableShape {
    var area: Float { get }
}

protocol LengthCalculatableShape {
    var length: Float { get }
}

class SquareISPNice: AreaCalculatableShape {
    var width: Float
    var height: Float

    var area: Float {
        width * height
    }

    init(
        width: Float,
        height: Float
    ) {
        self.width = width
        self.height = height
    }
}

class LineISPNice: LengthCalculatableShape {
    var pointA: Float
    var pointB: Float

    var length: Float {
        pointA - pointB
    }

    init(
        pointA: Float,
        pointB: Float
    ) {
        self.pointA = pointA
        self.pointB = pointB
    }
}
