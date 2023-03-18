//
//  DataStorage.swift
//  HelloSpringAnimation
//
//  Created by Богдан Радченко on 17.03.2023.
//

import SpringAnimation

final class DataStorage {
    static let shared = DataStorage()
    
    let animationPreset = AnimationPreset.allCases
    let animationCurve = AnimationCurve.allCases

    private init() {}
}
