//
//  Coordinate.swift
//  Stormy
//
//  Created by Leticia Rodriguez on 7/1/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
