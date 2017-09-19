//
//  Cell.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import Katana
import KatanaElements

struct CalculatorCell: NodeDescription, PlasticNodeDescription {
    typealias PropsType = Props
    typealias StateType = EmptyState
    typealias NativeView = UIView
    typealias Keys = ChildrenKeys
    
    var props: PropsType
    
    static func childrenDescriptions(props: PropsType, state: StateType, update: @escaping (StateType) -> (), dispatch: @escaping StoreDispatch) -> [AnyNodeDescription] {
        
        var children: [AnyNodeDescription] = [
            Button(props: .cellButtonProps(title: cellTitles[i], key: Keys.button, backgroundColor: cellBackgroundColors[i], fontColor: cellFontColors[i], didTap: nil))
        ]
        
//        if props.player != nil {
//            let image = Image(props: .gameCellImage(player: props.player, key: Keys.image))
//            children.append(image)
//        }
        
        return children
    }
    
    static func layout(views: ViewsContainer<Keys>, props: PropsType, state: StateType) {
        
        let nativeView = views.nativeView
        
        views[.image]?.fill(nativeView, insets: .scalable(10, 10, 10, 10))
        views[.button]?.fill(nativeView)
    }
}

extension CalculatorCell {
    enum ChildrenKeys {
        case button, image
    }
}

extension CalculatorCell {
    
    struct Props: NodeDescriptionProps {
        var frame: CGRect = .zero
        var key: String?
        var alpha: CGFloat = 1.0

        var didTap: () -> ()
        
        init(key: Any, didTap: @escaping () -> ()) {
            self.didTap = didTap
            self.setKey(key)
        }
    }
}
