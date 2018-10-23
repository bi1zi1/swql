//
//  LoadingTableViewCell.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-20.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

final class LoadingTableViewCell: UITableViewCell {
    let animateView: UIView

    required init?(coder aDecoder: NSCoder) {
        animateView = UIView()
        super.init(coder: aDecoder)
        configure()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        animateView = UIView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    private func configure() {
        animateView.frame = contentView.frame
        animateView.backgroundColor = UIColor.lightGray
        animateView.autoresizingMask = AutoresizingMask.flexibleWidth
        contentView.addSubview(animateView)

    }

    class var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension LoadingTableViewCell {
    override func willMove(toWindow newWindow: UIWindow?) {
        newWindow != nil
            ? startAnimation()
            : stopAnimation()
        super.willMove(toWindow: newWindow)
    }

    private func startAnimation() {
        animateView.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor,
                                UIColor.white.withAlphaComponent(0.8).cgColor,
                                UIColor.clear.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.7, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.8)
        gradientLayer.frame = animateView.bounds
        animateView.layer.mask = gradientLayer

        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2.0
        animation.fromValue = -animateView.frame.size.width
        animation.toValue = 1.5 * animateView.frame.size.width
        animation.repeatCount = .infinity

        gradientLayer.add(animation, forKey: "")

    }

    private func stopAnimation() {
        animateView.layer.removeAllAnimations()
        animateView.layer.mask = nil
    }
}
