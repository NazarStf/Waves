//
//  ContentView.swift
//  Waves
//
//  Created by NazarStf on 29.07.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var animateOffset = false
	@State private var tiltForwardBackward = false
	@State private var upAndDown = false
	@State private var leadingAnchorAniate = false
	
	var body: some View {
		ZStack {
		   //MARK: - BACKGROUND
			Color.blue
				.opacity(0.5)
				.edgesIgnoringSafeArea(.all)
			
			//MARK: - WAVE 1
			WaveCreation(animateOffset: $animateOffset, curveOne: 0.05, curveTwo: -0.05, radius: 50, shadowX: 0, shadowY: 50, duration: 5.0)
				.opacity(0.8)
				.offset(y: 575)
		}.onAppear() {
			animateOffset.toggle()
			playSound(name: "buoyBells", type: "m4a")
		}.onDisappear() {
			audioPlayer?.stop()
		}
	}
}

struct WaveCreation: View {
	@Binding var animateOffset: Bool
	var curveOne: CGFloat
	var curveTwo: CGFloat
	var radius: CGFloat
	var shadowX: CGFloat
	var shadowY: CGFloat
	var duration: Double
	
	var body: some View {
		WaveView(yOffset: animateOffset ? curveOne : curveTwo)
			.fill(Color(UIColor.blue))
			.shadow(color: .gray, radius: radius, x: shadowX, y: shadowY)
			.animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: true), value: animateOffset)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
