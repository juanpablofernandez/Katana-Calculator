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

enum CellType {
    case digit
    case operation
    case extra
    case equal
}

struct CalculatorCell: NodeDescription, PlasticNodeDescription {
    typealias PropsType = Props
    typealias StateType = EmptyState
    typealias NativeView = UIView
    typealias Keys = ChildrenKeys
    
    var props: PropsType
    
    static func childrenDescriptions(props: PropsType, state: StateType, update: @escaping (StateType) -> (), dispatch: @escaping StoreDispatch) -> [AnyNodeDescription] {
        
        let children: [AnyNodeDescription] = [
            Button(props: .cellButtonProps(title: props.title, key: Keys.button, backgroundColor: props.backgroundColor, fontColor: props.fontColor, didTap: props.didTap))
        ]
        
        return children
    }
    
    static func layout(views: ViewsContainer<Keys>, props: PropsType, state: StateType) {
        
        let nativeView = views.nativeView
        
        views[.button]?.fill(nativeView)
    }
}

extension CalculatorCell {
    enum ChildrenKeys {
        case button
    }
}

extension CalculatorCell {
    
    struct Props: NodeDescriptionProps {
        var frame: CGRect = .zero
        var key: String?
        var alpha: CGFloat = 1.0

        var didTap: () -> ()
        var backgroundColor: UIColor
        var fontColor: UIColor
        var title: String
        var type: CellType
        
        init(key: Any, title: String, type: CellType, didTap: @escaping () -> ()) {
            
            self.didTap = didTap
            self.title = title
            self.type = type
            
            if title == "" { self.alpha = 0 }
            
            switch type {
            case .digit:
                self.backgroundColor = .digitsBlue()
                self.fontColor = .fontGray()
            case .operation, .equal:
                self.backgroundColor = .operationsBlue()
                self.fontColor = .white
            case .extra:
                self.backgroundColor = .extrasBlue()
                self.fontColor = .fontGray()
            }
            
            self.setKey(key)
        }
    }
}
