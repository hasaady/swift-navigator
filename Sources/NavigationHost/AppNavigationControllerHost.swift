//
//  AppNavigationControllerHost.swift
//  
//
//  Created by Hanan on 05/04/2023.
//

import SwiftUI
import UIKit

struct AppNavigationControllerHost<Screen: View>: UIViewControllerRepresentable {
    
    let navigation: AppNavigation
    var navigationController: AppNavigationController
    
    init(_ navigation: AppNavigation, @ViewBuilder _ rootView: @escaping () -> Screen) {
        self.navigation = navigation
        let rootViewController = UIHostingController(rootView: rootView())
        self.navigationController = AppNavigationController(rootViewController: rootViewController)
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        navigation.onPush = { (viewController, animated) in
            navigationController.pushViewController(viewController, animated: animated)
        }
                
        navigation.onDismiss = { (animated, completion) in
            navigationController.dismiss(animated: animated, completion: completion)
        }
        
        navigation.onPop = { popTo, animated in
            switch popTo {
            case .previous:
                navigationController.popViewController(animated: animated)
            case .index(let index):
                guard navigationController.viewControllers.isEmpty == false else { break }
                let viewController = navigationController.viewControllers[index - 1]
                navigationController.popToViewController(viewController, animated: animated)
            case .root:
                navigationController.popToRootViewController(animated: animated)
            }
        }
        
        return navigationController
    }
    
    func updateUIViewController(_ navigation: UINavigationController, context: Context) {}
    
    static func dismantleUIViewController(_ navigation: UINavigationController, coordinator: ()) {
        navigation.viewControllers = []
    }
    
    typealias UIViewControllerType = UINavigationController
    
}
