//
//  HitViewDelegate.swift
//  old-version-of-secret-project
//
//  Created by Ilias Nikolaidis Olsson on 2021-12-14.
//

import UIKit

public protocol HitViewDelegate: AnyObject {
    
    func hitTest(_ point: CGPoint, view: UIView?, with event: UIEvent?) -> UIView?
    
}
