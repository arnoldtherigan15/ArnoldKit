//
//  ATButtonExample.swift
//  ArnoldKit
//
//  Created by Arnold Therigan on 24/07/25.
//

import SwiftUI

struct ATButtonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Group {
                    Text("Primary Buttons")
                        .font(.headline)
                    
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
                    
                    ATButton(
                        title: "Primary Button XS",
                        buttonType: .primary,
                        sizeType: .xs
                    ) {
                        print("Primary XS tapped")
                    }
                }

            }
            .padding()
        }
    }
}

#if DEBUG
struct ATButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ATButtonView()
    }
}
#endif
