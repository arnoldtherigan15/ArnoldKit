//
//  ATButtonSwiftType.swift
//  ArnoldKit
//
//  Created by Arnold Therigan on 24/07/25.
//

import SwiftUI

public enum ATButtonType {
    case primary
    case secondary
    case tertiary
    case critical
    case neutral
    case disabled
    
    var normalButtonColor: Color {
        switch self {
        case .primary:
            return Color(.ATGreen500)
        case .secondary:
            return Color(.ATGreen50)
        case .tertiary:
            return Color(.ATFlatWhite900)
        case .critical:
            return Color(.ATCriticalRed700)
        case .neutral:
            return Color(.ATNeutralGray50)
        case .disabled:
            return Color(.ATNeutralGray50)
        }
    }
    
    var textColor: Color {
        switch self {
        case .secondary:
            return Color(.ATGreen700)
        case .tertiary, .neutral:
            return Color(.ATNeutralGray700)
        case .disabled:
            return disabledTextColor
        default:
            return Color(.ATFlatWhite900)
        }
    }
    
    var disabledTextColor: Color {
        return Color(.ATNeutralGray200)
    }
    
    var isEnable: Bool {
        switch self {
        case .disabled:
            return false
        default:
            return true
        }
    }
}

public enum ATButtonSizeType {
    case xs
    case s
    case m
    
    var height: CGFloat {
        switch self {
        case .xs: return 25
        case .s: return 36
        case .m: return 48
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .xs: return 12
        case .s: return 16
        case .m: return 24
        }
    }
    
    var imageHeight: CGFloat {
        switch self {
        case .xs: return 16
        case .s: return 20
        case .m: return 24
        }
    }
    
    var font: Font {
        switch self {
        case .xs:
            return Font(ATTypography.heading(size: .xs).font)
        case .s:
            return Font(ATTypography.heading(size: .s).font)
        case .m:
            return Font(ATTypography.heading(size: .m).font)
        }
    }
}
