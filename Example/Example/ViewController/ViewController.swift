//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/12/4.
//

import UIKit
import WWPrint
import WWNetWorkMonitor

// MARK: - ViewController
final class ViewController: UIViewController {
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        demo()
    }
}

// MARK: - 小工具
private extension ViewController {
    
    func demo() {
        
        let currentStatus = WWNetWorkMonitor.shared.currnetNetworkPath().status
        wwPrint("currentStatus = \(currentStatus)")

        WWNetWorkMonitor.shared.start { path in
            wwPrint("use wifi [\(path.usesInterfaceType(.wifi))] => \(path.status)")
        }
    }
}
