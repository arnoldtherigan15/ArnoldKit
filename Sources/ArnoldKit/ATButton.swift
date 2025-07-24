//
//  File.swift
//  ArnoldKit
//
//  Created by Arnold Therigan on 23/07/25.
//

import SwiftUI

public struct ATButton: View {
    public init() {
        
    }
    public var body: some View {
        VStack {
            Image("ic_people", bundle: .module)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.yellow)
            Text("image test hai")
        }
        .padding()
    }
}

struct ImageWithTextView_Previews: PreviewProvider {
    static var previews: some View {
        ATButton()
    }
}

