//
//  ColorComponent.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-23.
//

import UIKit

public enum ColorComponent: String, Codable {
    case fill = "f"
    case stroke = "s"
}

public extension ColorComponent {
    
    var image: UIImage? {
        return .init(named: self == .fill ? "Component.Fill" : "Component.Stroke")
    }
    
    var opposite: ColorComponent {
        return self == .fill ? .stroke : .fill
    }
    
}
