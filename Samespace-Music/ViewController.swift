//
//  ViewController.swift
//  Samespace-Music
//
//  Created by AMAN K.A on 24/01/24.
//

//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        let tabViewController = TabViewController()
//        let tabView = tabViewController.view!
//        
//        view.addSubview(tabView)
//        addChild(tabViewController)
//        tabViewController.didMove(toParent: self)
//        
//        tabView.fillInSuperview()
//    }
//
//
//}

// ViewController.swift

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabViewController()
    }

    private func setupTabViewController() {
        let tabViewController = TabViewController()
        let tabView = tabViewController.view!
        
        view.addSubview(tabView)
        addChild(tabViewController)
        tabViewController.didMove(toParent: self)
        
        tabView.fillInSuperview()
    }
}



