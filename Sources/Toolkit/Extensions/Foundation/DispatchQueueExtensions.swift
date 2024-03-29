//
//  DispatchQueueExtensions.swift
//  old-version-of-secret-project
//
//  Created by Ilias Nikolaidis Olsson on 2021-12-26.
//

import Foundation

public extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
