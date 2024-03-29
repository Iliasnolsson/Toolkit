//
//  Button.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-10.
//

import UIKit

open class Button: UIButton {
    
    private var tintColorForStates: (isEnabledColor: UIColor, isDisabledColor: UIColor)?
    
    public var isAlmostConcave: Bool = false {
        didSet {
            if isAlmostConcave && isRounded {
                isRounded = false
            } else {
                reloadCorners()
            }
        }
    }
    
    public var isRounded: Bool = false {
        didSet {
            if isRounded && isAlmostConcave {
                isAlmostConcave = false
            } else {
                reloadCorners()
            }
        }
    }
      
    private var backgroundColorNormal: UIColor?
    public var backgroundColorHighlighted: UIColor? {
        didSet {
            backgroundColorReload()
        }
    }
    
    override public var isHighlighted: Bool {
        get {super.isHighlighted}
        set {
            let oldValue = isHighlighted
            super.isHighlighted = newValue
            if newValue != oldValue {
                backgroundColorReload()
            }
        }
    }
    
    override public var isEnabled: Bool {
        didSet {
            if oldValue == isEnabled {return}
            isEnabledChanged()
        }
    }
    
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(iOS 15.0, *)
    public static func initalize(withConfig configuration: UIButton.Configuration) -> UIButton {
        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        reloadCorners()
    }
    
    private func reloadCorners() {
        if isAlmostConcave {
            layer.cornerRadius = (bounds.height - 4) / 2
        } else if isRounded {
            layer.cornerRadius = bounds.height / 2
        }
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func tintColorSetFor(whenEnabled: UIColor, whenDisabled: UIColor) {
        tintColorForStates = (whenEnabled, whenDisabled)
        isEnabledChanged()
    }
    
    private func isEnabledChanged() {
        if let colorForStates = tintColorForStates {
            tintColor = isEnabled ? colorForStates.isEnabledColor : colorForStates.isDisabledColor
        }
    }
    
    private func backgroundColorReload() {
        if isHighlighted {
            if let highlightedColor = backgroundColorHighlighted {
                backgroundColorNormal = backgroundColor
                backgroundColor = highlightedColor
            }
        } else if backgroundColorNormal != nil {
            backgroundColor = backgroundColorNormal
        }
    }
    
}
