//
//  Circular.swift
//  CGRectExtensionsOSX
//
//  Created by Romain Menke on 04/10/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import Foundation


import Foundation
import Cocoa

public protocol CGRectCircularCalc {
    
    var origin : CGPoint { get set }
    var size : CGSize { get set }
    func rotationBounds() -> CGRect
    
}

public extension CGRectCircularCalc {
    
    public func rotationBounds() -> CGRect {
        
        let diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2))
        
        let xMargin = (size.width - diagonal) / 2
        let yMargin = (size.height - diagonal) / 2
        
        let newOrigin = CGPoint(x: xMargin, y: yMargin)
        
        return CGRect(x: newOrigin.x, y: newOrigin.y, width: diagonal, height: diagonal)
    }
    
}

extension CGRect: CGRectCircularCalc {
    
}