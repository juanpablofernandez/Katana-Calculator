//
//  AppDelegate.swift
//  Katana Calculator
//
//  Created by Juan Pablo on 9/18/17.
//  Copyright © 2017 Juan Pablo Fernandez. All rights reserved.
//

import UIKit
import Katana

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var renderer: Renderer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UIViewController()
        self.window?.makeKeyAndVisible()
        
        let view = self.window!.rootViewController!.view!
        
        let intro = Calculator(props: Calculator.Props.build {
            $0.frame = UIScreen.main.bounds
        })
        
//        let store = Store<ApplicationState>()
        self.renderer = Renderer(rootDescription: intro, store: nil)
        self.renderer?.render(in: view)
        
        return true
    }
}

