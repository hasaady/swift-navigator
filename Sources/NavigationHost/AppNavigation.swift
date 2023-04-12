//
//  AppNavigation.swift
//  
//
//  Created by Hanan on 01/04/2023.
//

import Foundation
import SwiftUI

public class AppNavigation: ObservableObject {
    
    enum PopTo {
        case previous
        case index(Int)
        case root
    }
    
    var onPush: ((_ viewController: UIViewController, _ animated: Bool) -> Void)?
    var onPop: ((_ to: PopTo, _ animated: Bool) -> Void)?
    var onPresent: ((_ viewController: UIViewController, _ animated: Bool) -> Void)?
    var onDismiss: ((_ animated: Bool, _ completion: (() -> Void)?) -> Void)?
    
    public init() {}
    
    public func push(animated: Bool, _ view: () -> some View) {
        let viewController = UIHostingController(rootView: view())
        onPush?(viewController, animated)
    }
    
    public func push(_ viewController: UIViewController, animated: Bool) {
        onPush?(viewController, animated)
    }
    
    public func present(animated: Bool, _ view: () -> some View) {
        let viewController = UIHostingController(rootView: view())
        onPresent?(viewController, animated)
    }
    
    public func pop(animated: Bool) {
        onPop?(.previous, animated)
    }
    
    public func popTo(_ index: Int, animated: Bool) {
        onPop?(.index(index), animated)
    }
    
    public func popToRoot(animated: Bool) {
        onPop?(.root, animated)
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        onDismiss?(animated, completion)
    }
    
}
