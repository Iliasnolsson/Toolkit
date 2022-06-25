//
//  UIResponderExtensions.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-10-01.
//

import UIKit

public extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}
