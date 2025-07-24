//
//  File.swift
//  ArnoldKit
//
//  Created by Arnold Therigan on 23/07/25.
//

import CoreText
import UIKit
import SwiftUI

public enum ATTypography {
    public enum ATFont: String, CaseIterable {
        case poppins = "Poppins"
    }
    
    public enum SizeTypes: String, CaseIterable {
        case xl2 = "2XL"
        case xl = "XL"
        case l = "L"
        case m = "M"
        case s = "S"
        case xs = "XS"
        case xs2 = "2XS"
    }
    
    public enum StrengthTypes: String, CaseIterable {
        case bold = "Bold"
        case medium = "Medium"
        case regular = "Regular"
    }
    
    case heading(size: SizeTypes, type: StrengthTypes = .regular)
    case text(size: SizeTypes, type: StrengthTypes)
    
    public struct Typography {
        public let font: UIFont
        public let spacing: Double
        public let lineHeight: Double
    }

    public var typographyValue: Typography {
        return .init(font: self.font, spacing: self.spacing, lineHeight: self.lineHeight)
    }

    public var fontName: String {
        switch self {
        case .heading(_, let type):
            switch type {
            case .bold:
                return "\(ATFont.poppins.rawValue)-ExtraBold"
            case .regular :
                return "\(ATFont.poppins.rawValue)-Bold"
            default:
                return "\(ATFont.poppins.rawValue)-Bold"
            }
        case .text(_, let type):
            switch type {
            case .bold:
                return "\(ATFont.poppins.rawValue)-ExtraBold"
            case .regular :
                return "\(ATFont.poppins.rawValue)-SemiBold"
            default:
                return "\(ATFont.poppins.rawValue)-Regular"
            }
        }
    }

    public var font: UIFont {
        return .init(name: self.fontName, size: self.size) ?? .init()
    }

    /// the italic version of the font.
    public var italicFont: UIFont {
        let italicFontName = ATTypographyLoader.getItalicFontVersionName(fontName: fontName)
        return .init(name: italicFontName, size: self.size) ?? .init()
    }

    public var spacing: Double {
        return 0.0
    }
    
    public var size: CGFloat {
        switch self {
        case .heading(let size, _):
            switch size {
            case .xl2:
                return 24
            case .xl:
                return 20
            case .l:
                return 18
            case .m:
                return 16
            case .s:
                return 14
            default:
                return 12
            }
        case .text(let size, _):
            switch size {
            case .xl2:
                return 28
            case .xl:
                return 24
            case .l:
                return 20
            case .m:
                return 16
            case .s:
                return 15
            case .xs:
                return 13
            case .xs2:
                return 11
            }
        }
    }
    
    public var lineHeight: Double {
        switch self {
        case .heading(let size, _):
            switch size {
            case .xl2:
                return 1.1
            case .xl:
                return 1.03
            case .l:
                return 0.98
            case .m:
                return 1.1
            case .s:
                return 1.05
            default:
                return 0.98
            }
        case .text(let size, _):
            switch size {
            case .xl2:
                return 1.05
            case .xl:
                return 1.1
            case .l:
                return 1.17
            case .m:
                return 1.1
            case .s:
                return 0.98
            case .xs:
                return 0.99
            case .xs2:
                return 0.8
            }
        }
    }
}


public final class ATTypographyLoader {
    public static func getBundle() -> Bundle {
        return Bundle(for: self)
    }
//    private static func registerFont(withName name: String, fileExtension: String) {
//        let frameworkBundle = self.getBundle()
//        if
//            let pathForResourceString = frameworkBundle.path(forResource: name, ofType: fileExtension),
//            let fontData = NSData(contentsOfFile: pathForResourceString),
//            let dataProvider = CGDataProvider(data: fontData),
//            let fontRef = CGFont(dataProvider)
//        {
//            var errorRef: Unmanaged<CFError>?
//            if CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false {
//                print("Error registering font")
//            }
//        } else {
//            print("font not found in bundle/ font \(name) is not supported yet")
//        }
//        
//        
//    }
    
    private static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("error")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }

    public static func loadFonts() {
//        for fontName in ATTypography.ATFont.allCases {
//            for type in ATTypography.StrengthTypes.allCases {
//                let originalFontName = "\(fontName.rawValue)-\(type.rawValue)"
//                let italicFontName = self.getItalicFontVersionName(fontName: originalFontName)
//                registerFont(withName: originalFontName, fileExtension: "ttf")
//                registerFont(withName: italicFontName, fileExtension: "ttf")
//            }
//        }
        registerFont(bundle: .module, fontName: "Poppins-Bold", fontExtension: "ttf")
        registerFont(bundle: .module, fontName: "PoiretOne-Regular", fontExtension: "ttf")
    }

    public static func getItalicFontVersionName(fontName: String) -> String {
        if fontName.contains("Regular") {
            return fontName.replacingOccurrences(of: "Regular", with: "Italic")
        } else {
            return fontName + "Italic"
        }
    }
}
