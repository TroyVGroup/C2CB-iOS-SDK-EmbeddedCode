//
//  GradientView.swift
//  C2CB-iOS-Library
//
//  Created by V Group Inc on 05/12/23.
//

import Foundation
class GradientView: UIView {
//background: linear-gradient(180deg, #00A6FF 0%, #0F204B 100%);
     var startColor:   UIColor = .black { didSet { updateColors() }}
     var endColor:     UIColor = .white { didSet { updateColors() }}
     var startLocation: Double =   0.05 { didSet { updateLocations() }}
     var endLocation:   Double =   0.95 { didSet { updateLocations() }}
     var horizontalMode:  Bool =  false { didSet { updatePoints() }}
     var diagonalMode:    Bool =  false { didSet { updatePoints() }}

    override public class var layerClass: AnyClass { CAGradientLayer.self }

    var gradientLayer: CAGradientLayer { layer as! CAGradientLayer }

    func updatePoints() {
        if horizontalMode {
            gradientLayer.startPoint = diagonalMode ? .init(x: 1, y: 0) : .init(x: 0, y: 0.5)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 0, y: 1) : .init(x: 1, y: 0.5)
        } else {
            gradientLayer.startPoint = diagonalMode ? .init(x: 0, y: 0) : .init(x: 0.5, y: 0)
            gradientLayer.endPoint   = diagonalMode ? .init(x: 1, y: 1) : .init(x: 0.5, y: 1)
        }
    }
    func updateLocations() {
        gradientLayer.locations = [startLocation as NSNumber, endLocation as NSNumber]
    }
    func updateColors() {
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
    }
    //MARK: - cornerRadius View
    func setcornerRadiusView() {
        self.layer.cornerRadius = self.layer.bounds.height / 2
        self.clipsToBounds = true
    }
    override public func layoutSubviews() {
        super.layoutSubviews()
        updatePoints()
        updateLocations()
        updateColors()
        setcornerRadiusView()
    }
    
}
