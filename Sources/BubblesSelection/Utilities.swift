//
//  Utilities.swift
//  BubblesSelection
//
//  Created by Aleksei Bochkov on 07/05/22.
//

import UIKit

//Class with different helping functions
class Utilities {
    
    //Returns the distance between two CGPoints
    static func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        let xDist = a.x - b.x
        let yDist = a.y - b.y
        return CGFloat(sqrt(xDist * xDist + yDist * yDist))
    }
}
