//
//  LottieView.swift
//  LeaseLimit
//
//  Created by Kurt Weber on 1/4/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView( frame: .zero)
        
        let animationView = LottieAnimationView()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        LottieAnimation.loadedFrom(url: url, closure: {
            animation in
            animationView.animation = animation
            animationView.play()
        }, animationCache: DefaultAnimationCache.sharedCache)
        
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor
                .constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor
                .constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    // we dont use this function but its needed for UIViewRepresentable
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

