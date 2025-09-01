//
//  ContentView.swift
//  LiquidGlassEffect
//
//  Created by Nana Yaw on 9/1/25.
//

import SwiftUI

struct LiquidGlassEffectContainer: View {
    // Constants for animation
    private let mergedSpacing: CGFloat = -20.0
    private let separatedSpacing: CGFloat = 50.0
    private let iconOffset: CGFloat = 15.0
    private let animationDuration: Double = 2.0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            PhaseAnimator([false, true]) { morph in
                HStack(spacing: morph ? separatedSpacing : mergedSpacing) {
                    // First glass button with icon
                    ZStack {
                        Circle()
                            .fill(.regularMaterial)
                            .frame(width: 80, height: 80)
                            .overlay(
                                Circle()
                                    .strokeBorder(.primary.opacity(0.2), lineWidth: 0.5)
                            )
                        
                        Image(systemName: "dog.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.green)
                            .offset(x: morph ? 0 : -iconOffset)
                    }
                    
                    // Second glass button with icon
                    ZStack {
                        Circle()
                            .fill(.regularMaterial)
                            .frame(width: 80, height: 80)
                            .overlay(
                                Circle()
                                    .strokeBorder(.primary.opacity(0.2), lineWidth: 0.5)
                            )
                        
                        Image(systemName: "house.fill")
                            .font(.system(size: 45))
                            .foregroundColor(.green)
                            .offset(x: morph ? 0 : iconOffset)
                    }
                }
                .animation(.easeInOut(duration: animationDuration).repeatForever(autoreverses: true), value: morph)
            }
        }
    }
}

#Preview {
    LiquidGlassEffectContainer()
        .preferredColorScheme(.dark)
}
