//
//  PresentViewController.swift
//  HelloSpringAnimation
//
//  Created by Богдан Радченко on 16.03.2023.
//

import UIKit
import SpringAnimation

final class PresentViewController: UIViewController {
    let animations = Animation.getAnimations()
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var rotateLabel: UILabel!
    
    @IBOutlet var startButton: UIButton!
    
    var currentAnimation = ""
    lazy var nextAnimation = animations[Int.random(in: 0..<animations.count)].animationName
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("Run \(nextAnimation)", for: .normal)
    }
    
    @IBAction func startAnimation() {
        setupAnimation()
        fillLabels()
    }
    
    private func setupAnimation() {
        let randomElement = animations[Int.random(in: 0..<animations.count)]
        
        currentAnimation = nextAnimation
        animationView.animation = currentAnimation
        animationView.curve = randomElement.curveName
        animationView.force = CGFloat(randomElement.forceAnimation)
        animationView.duration = CGFloat(randomElement.durationAnimation)
        animationView.delay = CGFloat(randomElement.delayAnimation)
        animationView.velocity = CGFloat(randomElement.velocityAnimation)
        animationView.rotate = CGFloat(randomElement.rotateAnimation)
        animationView.animate()
        
        nextAnimation = randomElement.animationName
        startButton.setTitle("Run \(nextAnimation)", for: .normal)
    }
    
    private func fillLabels() {
        presetLabel.text = currentAnimation
        curveLabel.text = animationView.curve
        forceLabel.text = string(animationView.force)
        durationLabel.text = string(animationView.duration)
        delayLabel.text = string(animationView.delay)
        velocityLabel.text = string(animationView.velocity)
        rotateLabel.text = string(animationView.rotate)
    }
    
    private func string(_ animationValue: CGFloat) -> String {
        String(format: "%.2f", animationValue)
    }
}
