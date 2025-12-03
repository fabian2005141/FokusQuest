//
//  ProgressHelpers.swift
//  Productivity_Challenge
//
//  Created by Richard brüse on 03.12.25.
//

import Foundation

func decodeCompletedIDs(from raw: String) -> Set<Int> {
    Set(
        raw
            .split(separator: ",")
            .compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
    )
}

func encodeCompletedIDs(_ ids: Set<Int>) -> String {
    ids
        .sorted()
        .map(String.init)
        .joined(separator: ",")
}
