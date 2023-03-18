//
//  Animation.swift
//  HelloSpringAnimation
//
//  Created by Богдан Радченко on 17.03.2023.
//

struct Animation {
    
    let animationName: String
    let curveName: String
    var forceAnimation: Float {
        Float.random(in: 0.5...1.5)
    }
    var durationAnimation: Float {
        Float.random(in: 0...2)
    }
    let delayAnimation = 0.3
    var velocityAnimation: Float {
        Float.random(in: 0...2)
    }
    var rotateAnimation: Float {
        Float.random(in: 0...1)
    }
    
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        
        let animationShuffled = DataStorage.shared.animationPreset
        let curveShuffled = DataStorage.shared.animationCurve

        let minimalCount = min(
            animationShuffled.count,
            curveShuffled.count
        )

        for index in 0..<minimalCount {
            animations.append(
                Animation(
                    animationName: animationShuffled[index].rawValue,
                    curveName: curveShuffled[index].rawValue
                )
            )
        }
        return animations
    }
}
