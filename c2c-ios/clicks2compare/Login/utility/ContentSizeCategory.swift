//
//  ContentSizeCategory.swift
//  clicks2compare
//
//  Created by user257152 on 2/19/24.
//

import Foundation
import SwiftUI


extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraLarge:
            return 1.0
        case .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}
