//
//  Float+Extensions.swift
//  Swift Synth
//
//  Created by Matthew Fecher on 1/5/16.
//  Copyright © 2016 AudioKit. All rights reserved.
//

import Foundation

// *********************************************************
// MARK: - UI Helper Extensions
// *********************************************************

extension Float {
    
    // Return string formatted to 2 decimal places
    var decimalString: String {
        return String(format: "%.02f", self)
    }
    
    // *********************************************************
    // MARK: - Random Float Generators
    // *********************************************************
    
    // return random number between 0.0 and 1.0
    public static func random() -> Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
    
    // return random number in range
    public static func random(min min: Float, max: Float) -> Float {
        return Float.random() * (max - min) + min
    }
    
    // return either -1 or 1 randomly
    public static func randomSign() -> Float {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }
    
    // *********************************************************
    // MARK: - Scale Range
    // *********************************************************
    
    // Linear scale 0.0 to 1.0 to any range
    public static func scaleRange(value: Float, rangeMin: Float, rangeMax: Float) -> Float {
        return ((rangeMax - rangeMin) * (value - 0.0) / (1.0 - 0.0)) + rangeMin
    }
    
    // Logarithmically scale 0.0 to 1.0 to any range
    public static func scaleRangeLog(value: Float, rangeMin: Float, rangeMax: Float) -> Float {
        let scale = (log(rangeMax) - log(rangeMin))
        return exp(log(rangeMin) + (scale * value))
    }
}