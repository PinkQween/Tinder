//
//  CardImageIndicatorView.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0..<imageCount, id: \.self) { value in
                Capsule()
                    .foregroundStyle(value == currentImageIndex ? .white : .gray)
                    .frame(width: imageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: .constant(0), imageCount: 3)
        .preferredColorScheme(.dark)
}
