//
//  File.swift
//  
//
//  Created by Derek Gour on 2024-01-15.
//

import Foundation

public enum ProbabilityError: Error {
    case numberTooLarge(String)
    case numberTooSmall(String)
    case badInput(String)
    case kTooLarge
}
