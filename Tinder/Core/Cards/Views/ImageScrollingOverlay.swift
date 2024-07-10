//
//  ImageScrollingOverlay.swift
//  Tinder
//
//  Created by Hanna Skairipa on 7/1/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(_ increment: Bool) {
        if increment {
            if currentImageIndex + 1 < imageCount {
                currentImageIndex += 1
            } else {
                currentImageIndex = 0
            }
        } else {
                if currentImageIndex > 0 {
                    currentImageIndex -= 1
                } else {
                    currentImageIndex = imageCount - 1
                }
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(0), imageCount: 1)
}
