//
//  File.swift
//  ArnoldKit
//
//  Created by Arnold Therigan on 23/07/25.
//
import SwiftUI

public struct ATButton: View {
    private let title: String
    private let image: Image?
    private let buttonType: ATButtonType
    private let sizeType: ATButtonSizeType
    private let action: () -> Void
    
    public init(
        title: String,
        systemImage: String? = nil,
        buttonType: ATButtonType = .primary,
        sizeType: ATButtonSizeType = .m,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.image = systemImage.map { Image(systemName: $0) }
        self.buttonType = buttonType
        self.sizeType = sizeType
        self.action = action
        ATTypographyLoader.loadFonts()
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: sizeType.imageHeight)
                        .foregroundColor(buttonType.textColor)
                }
                
                Text(title)
                    .font(sizeType.font)
                    .foregroundColor(buttonType.textColor)
            }
            .padding(.horizontal, sizeType.horizontalPadding)
            .frame(height: sizeType.height)
            .background(buttonType.normalButtonColor)
            .cornerRadius(sizeType.height / 2)
        }
        .disabled(!buttonType.isEnable)
    }
}

struct ATButton_Previews: PreviewProvider {
    static var previews: some View {
//        Text("title")
//            .font(Font(ATTypography.heading(size: .xs).font))
        VStack {
            ATButton(
                title: "Primary Button M",
                buttonType: .primary,
                sizeType: .m
            ) {
                print("Primary M tapped")
            }
            
            ATButton(
                title: "Primary Button S",
                buttonType: .primary,
                sizeType: .s
            ) {
                print("Primary S tapped")
            }
        }
        .onAppear {
            ATTypographyLoader.loadFonts()
        }

    }
}

