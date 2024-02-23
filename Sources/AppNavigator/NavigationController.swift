//
//  NavigationController.swift
//  
//
//  Created by Hanan on 05/04/2023.
//

import UIKit

class NavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
}
