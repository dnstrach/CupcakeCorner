//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Dominique Strachan on 12/12/23.
//

import Foundation

extension String {
    // string of pure whitespace is invalid
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
