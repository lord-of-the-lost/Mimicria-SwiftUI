//
//  ContentView.swift
//  Mimicria
//
//  Created by Николай Игнатов on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isSmallButton = true
    
    var body: some View {
        VStack {
            if isSmallButton {
                Spacer()
            }
            RoundedRectangleView(isSmallButton: $isSmallButton)
        }
        .padding()
    }
}

struct RoundedRectangleView: View {
    @Binding var isSmallButton: Bool
    
    var body: some View {
        let width: CGFloat = isSmallButton ? 90 : 300
        let height: CGFloat = isSmallButton ? 40 : 400
        
        HStack {
            if isSmallButton {
                Spacer()
            }
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
                .frame(width: width, height: height)
                .overlay {
                    ButtonView(isSmallButton: $isSmallButton)
                }
        }
    }
}

struct ButtonView: View {
    @Binding var isSmallButton: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeInOut) {
                        isSmallButton.toggle()
                    }
                }) {
                    ButtonLabel(isSmallButton:  $isSmallButton)
                        .padding()
                }
                if !isSmallButton {
                    Spacer()
                }
            }
            if !isSmallButton {
                Spacer()
            }
        }
    }
}

struct ButtonLabel: View {
    @Binding var isSmallButton: Bool
    
    var body: some View {
        Label {
            Text(isSmallButton ? "Open" : "Back")
        } icon: {
            if !isSmallButton {
                Image(systemName: "arrowshape.backward.fill")
            }
        }
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
