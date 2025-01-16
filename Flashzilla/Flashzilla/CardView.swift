//
//  CardView.swift
//  Flashzilla
//
//  Created by C3PO MBP on 13/01/25.
//

import SwiftUI

// challenge 2 - part 4
extension View {
    func cardBackground(offset: CGSize, isDragging: Bool) -> some View {
        self.background(
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    isDragging
                    ? offset.width > 0 ? .green : .red
                    : .white
                )
        )
    }
}

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var offset = CGSize.zero
    @State private var isShowingAnswer = false
    // challenge 2 - part 1
    @State private var isDragging = false
    
    let card: Card
    // challenge 3 - part 4
    var removal: ((Bool) -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor
                    ? .white
                    : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                // challenge 2 - part 5
                .cardBackground(offset: offset, isDragging: isDragging)
                .shadow(radius: 10)
            
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    // challenge 2 - part 2
                    isDragging = true
                    offset = gesture.translation
                }
                .onEnded { _ in
                    // challenge 2 - part 3
                    isDragging = false
                    if abs(offset.width) > 100 {
                        // challenge 3 - part 5
                        removal?(offset.width > 0)
                    } else {
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.bouncy, value: offset)
    }
}

#Preview {
    CardView(card: .example)
}
