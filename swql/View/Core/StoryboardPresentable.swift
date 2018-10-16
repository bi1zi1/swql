//
//  StoryboardPresentable.swift
//  swql
//
//  Created by Aleksandar Mihailovski on 2018-10-15.
//  Copyright © 2018 Aleksandar Mihailovski. All rights reserved.
//

import UIKit

protocol StoryboardPresentable {
    static var storyboardName: String { get }
    static var viewControllerID: String { get }

    associatedtype ViewControllerT: UIViewController
    static func instantiate() -> ViewControllerT
}

extension StoryboardPresentable where Self: UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName,
                                      bundle: nil)
        // swiftlint:disable:next force_cast
        let controller = storyboard.instantiateViewController(withIdentifier: viewControllerID) as! Self
        return controller
    }
}
