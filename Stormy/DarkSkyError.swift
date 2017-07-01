//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Leticia Rodriguez on 7/1/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccesful
    case invalidData
    case jsonConversionFailure
    case invalidURL
    case jsonParsingFailure
}
