//
//  AppNavigationControllerHost.swift
//  
//
//  Created by Hanan on 05/04/2023.
//

import SwiftUI
import UIKit

struct NavigationControllerHost<Screen: View>: UIViewControllerRepresentable {
    
    let navigator: Navigator
    var navigatorController: NavigationController
    
    init(navigator: Navigator, @ViewBuilder root: @escaping () -> Screen) {
        self.navigator = navigator
        let rootViewController = UIHostingController(rootView: root())
        self.navigatorController = NavigationController(rootViewController: rootViewController)
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        navigator.onPush = { (viewController, animated) in
            navigatorController.pushViewController(viewController, animated: animated)
        }
        
        navigator.onPresent = { (viewController, animated) in
            navigatorController.present(viewController, animated: animated)
        }
        
        navigator.onDismiss = { (animated, completion) in
            navigatorController.dismiss(animated: animated, completion: completion)
        }
        
        navigator.onPop = { popTo, animated in
            switch popTo {
            case .previous:
                navigatorController.popViewController(animated: animated)
            case .index(let index):
                guard navigatorController.viewControllers.isEmpty == false else { break }
                let viewController = navigatorController.viewControllers[index - 1]
                navigatorController.popToViewController(viewController, animated: animated)
            case .root:
                navigatorController.popToRootViewController(animated: animated)
            }
        }
        
        navigator.topViewController = {
            return navigatorController.viewControllers.last
        }
        
        return navigatorController
    }
    
    func updateUIViewController(_ navigator: UINavigationController, context: Context) {}
    
    static func dismantleUIViewController(_ navigator: UINavigationController, coordinator: ()) {
        navigator.viewControllers = []
    }
    
    typealias UIViewControllerType = UINavigationController
    
}
