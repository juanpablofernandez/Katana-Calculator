//
//  Elements.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import UIKit
import KatanaElements


extension Label.Props {
    
    static func resultsLabelProps<K>(content: String, key: K) -> Label.Props {
        var props = Label.Props()
        
        props.backgroundColor = .clear
        props.textAlignment = .right
        
        props.text = NSAttributedString(string: content, attributes: [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 50.0)!
            ])
        
        props.setKey(key)
        
        return props
    }
}


extension Button.Props {
    
    static func cellButtonProps<K>(title: String, key: K, backgroundColor: UIColor, fontColor: UIColor, didTap: (() -> ())?) -> Button.Props {
        var props = Button.Props()
        
        props.setKey(key)
        props.backgroundColor = backgroundColor
        props.borderColor = backgroundColor != .clear ? .backgroundBlue() : .clear
        props.borderWidth = .scalable(2)
//        props.cornerRadius = .scalable(10)
        
        props.attributedTitles = [
            .normal: NSAttributedString(string: title, attributes: [
                NSForegroundColorAttributeName: fontColor,
                NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 25.0)!
                ]),
            
            .highlighted: NSAttributedString(string: title, attributes: [
                NSForegroundColorAttributeName: fontColor.withAlphaComponent(0.5),
                NSFontAttributeName: UIFont(name: "HelveticaNeue-Light", size: 25.0)!
                ])
        ]
        
        if let didTap = didTap {
            props.touchHandlers = [.touchUpInside: didTap]
        }
        
        return props
    }
}
