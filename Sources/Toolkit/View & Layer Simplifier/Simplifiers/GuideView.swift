//
//  GuideView.swift
//  Final Animation
//
//  Created by Ilias Nikolaidis Olsson on 2021-06-10.
//

import UIKit

open class GuideView: View {
    
    override public init() {
        super.init()
        isHidden = true
        backgroundColor = .red
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
