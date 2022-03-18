//
//  UILabel+Extensions.swift
//  ComponentsUI
//
//  Created by Samuel Brehm on 18/03/22.
//

import Foundation
import UIKit

extension UILabel {
    func startShimmering() {
        let light = UIColor(white: 0, alpha: 0.1).cgColor
        let dark = UIColor.black.cgColor

        let gradient = CAGradientLayer()
        gradient.colors = [dark, light, dark].compactMap { $0 }
        gradient.frame = CGRect(x: -bounds.size.width, y: 0, width: 3 * bounds.size.width, height: bounds.size.height)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525) // slightly slanted forward
        gradient.locations = [NSNumber(value: 0.4), NSNumber(value: 0.5), NSNumber(value: 0.6)]
        layer.mask = gradient

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [NSNumber(value: 0.0), NSNumber(value: 0.1), NSNumber(value: 0.2)]
        animation.toValue = [NSNumber(value: 0.8), NSNumber(value: 0.9), NSNumber(value: 1.0)]

        animation.duration = 1.5
        animation.repeatCount = .infinity
        gradient.add(animation, forKey: "shimmer")
    }

    func stopShimmering() {
        layer.mask = nil
    }
}
