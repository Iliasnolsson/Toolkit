//
//  ChangeState.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-24.
//

import UIKit

public enum MethodState {
    case began
    case changed
    case ended
    case none
    
    public init(gestureState: UIGestureRecognizer.State) {
        switch gestureState {
        case .began:
            self = .began
        case .changed:
            self = .changed
        case .ended:
            self = .ended
        case .cancelled:
            self = .ended
        default:
            self = .ended
        }
    }
    
}

public extension MethodState {
    
    var isFinalState: Bool {return self == .ended || self == .none}
    
}
