//
//  AppNavigationController.swift
//  
//
//  Created by Hanan on 05/04/2023.
//

import UIKit

class AppNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
}
