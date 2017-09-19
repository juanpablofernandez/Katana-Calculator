//
//  Calculator.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/19/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import Foundation
import Katana
import KatanaElements

enum Operation {
    case add, subtract, divide, multiply
}

struct Calculator: NodeDescription, PlasticReferenceSizeable, PlasticNodeDescription {
    typealias PropsType = Props
    typealias StateType = EmptyState
    typealias NativeView = UIView
    typealias Keys = ChildrenKeys
    
    static var referenceSize = CGSize(width: 320, height: 568)
    var props: PropsType
    
    static func childrenDescriptions(props: PropsType, state: StateType, update: @escaping (StateType) -> (), dispatch: @escaping StoreDispatch) -> [AnyNodeDescription] {
        
        var children: [AnyNodeDescription] = [
            View(props: View.Props.build {
                $0.backgroundColor = .backgroundBlue()
                $0.setKey(Keys.background)
            }),
            
            Label(props: .resultsLabelProps(content: "0", key: Keys.result))
            
//            Button(props: .cellButtonProps(title: "0", key: Keys.cell1, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: "0", key: Keys.cell2, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: ".", key: Keys.cell3, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: "=", key: Keys.cell4, backgroundColor: .operationsBlue(), fontColor: .white, didTap: nil)),
//            
//            Button(props: .cellButtonProps(title: "1", key: Keys.cell5, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: "2", key: Keys.cell6, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: "3", key: Keys.cell7, backgroundColor: .digitsBlue(), fontColor: .fontGray(), didTap: nil)),
//            Button(props: .cellButtonProps(title: "+", key: Keys.cell8, backgroundColor: .operationsBlue(), fontColor: .white, didTap: nil))
            
            ]
        
        let cellKeys: [ChildrenKeys] = [Keys.cell17, Keys.cell18, Keys.cell19, Keys.cell20,
                                        Keys.cell13, Keys.cell14, Keys.cell15, Keys.cell16,
                                        Keys.cell9, Keys.cell10, Keys.cell11, Keys.cell12,
                                        Keys.cell5, Keys.cell6, Keys.cell7, Keys.cell8,
                                        Keys.cell1, Keys.cell2, Keys.cell3, Keys.cell4]
        
        let cellTitles = ["C", "+/-", "%", "÷",
                          "7", "8", "9", "X",
                          "4", "5", "6", "-",
                          "1", "2", "3", "+",
                          "0", "", ".", "="]
        
        let cellBackgroundColors: [UIColor] = [.extrasBlue(), .extrasBlue(), .extrasBlue(), .operationsBlue(),
                                               .digitsBlue(), .digitsBlue(), .digitsBlue(), .operationsBlue(),
                                               .digitsBlue(), .digitsBlue(), .digitsBlue(), .operationsBlue(),
                                               .digitsBlue(), .digitsBlue(), .digitsBlue(), .operationsBlue(),
                                               .digitsBlue(), .clear, .digitsBlue(), .operationsBlue()]
        
        let cellFontColors: [UIColor] = [.fontGray(), .fontGray(), .fontGray(), .white,
                                         .fontGray(), .fontGray(), .fontGray(), .white,
                                         .fontGray(), .fontGray(), .fontGray(), .white,
                                         .fontGray(), .fontGray(), .fontGray(), .white,
                                         .fontGray(), .clear, .fontGray(), .white]
        
        for i in 0..<cellTitles.count {
            
            let cell = Button(props: .cellButtonProps(title: cellTitles[i], key: cellKeys[i], backgroundColor: cellBackgroundColors[i], fontColor: cellFontColors[i], didTap: nil))
            
            children.append(cell)
        }
        
        return children
    }
    
    static func layout(views: ViewsContainer<Calculator.ChildrenKeys>, props: Calculator.Props, state: EmptyState) {
        let nativeView = views.nativeView
        let background = views[.background]!
        let result = views[.result]!
        
        // background
        background.fill(nativeView)
        
        //First row
        let firstRow = [views[.cell1]!, views[.cell2]!, views[.cell3]!, views[.cell4]!]
        
        firstRow.fill(left: nativeView.left, right: nativeView.right)
        for cell in firstRow {
            cell.height = cell.width
            cell.bottom = nativeView.bottom
        }
        
        views[.cell1]!.width = views[.cell1]!.width * 2
        
        //Second row
        let secondRow = [views[.cell5]!, views[.cell6]!, views[.cell7]!, views[.cell8]!]
        
        secondRow.fill(left: nativeView.left, right: nativeView.right)
        for cell in secondRow {
            cell.height = cell.width
            cell.bottom = firstRow[0].top
        }
        
        //Third row
        let thirdRow = [views[.cell9]!, views[.cell10]!, views[.cell11]!, views[.cell12]!]
        
        thirdRow.fill(left: nativeView.left, right: nativeView.right)
        for cell in thirdRow {
            cell.height = cell.width
            cell.bottom = secondRow[0].top
        }
        
        //Fourth row
        let fourthRow = [views[.cell13]!, views[.cell14]!, views[.cell15]!, views[.cell16]!]
        
        fourthRow.fill(left: nativeView.left, right: nativeView.right)
        for cell in fourthRow {
            cell.height = cell.width
            cell.bottom = thirdRow[0].top
        }
        
        //fifth row
        let fifthRow = [views[.cell17]!, views[.cell18]!, views[.cell19]!, views[.cell20]!]
        
        fifthRow.fill(left: nativeView.left, right: nativeView.right)
        for cell in fifthRow {
            cell.height = cell.width
            cell.bottom = fourthRow[0].top
        }
        
        //Result
        result.fillHorizontally(nativeView, insets: .scalable(0, 15, 0, 15))
        
        result.bottom = fifthRow[0].top
        result.height = fifthRow[0].height
    }
}

extension Calculator {
    enum ChildrenKeys {
        case background
        case result
        
        case cell1, cell2, cell3, cell4,
            cell5, cell6, cell7, cell8,
            cell9, cell10, cell11, cell12,
            cell13, cell14, cell15, cell16,
            cell17, cell18, cell19, cell20
    }
}

extension Calculator {
    struct Props: NodeDescriptionProps, Buildable {
        var frame: CGRect = .zero
        var key: String?
        var alpha: CGFloat = 1.0
    }
}
