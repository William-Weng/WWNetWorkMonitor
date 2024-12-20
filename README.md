# WWNetWorkMonitor

[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWNetWorkMonitor) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

## [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Integrate NWPathMonitor to detect network connections.](https://developer.apple.com/documentation/network/nwpathmonitor)
- [整合NWPathMonitor來偵測網路連線。](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-nwpathmonitor-偵測網路連線-58e3c6aa2832)

![WWNetWorkMonitor](./Example.png)

## [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWNetWorkMonitor.git", .upToNextMajor(from: "1.0.0"))
]
```

## 可用函式
|函式|說明|
|-|-|
|currnetNetworkPath()|取得當前網路的相關訊息|
|start(for:queue:result:)|開始監控|
|cancel()|停止監控|

## Example
```swift
import UIKit
import WWPrint
import WWNetWorkMonitor

final class ViewController: UIViewController {
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        demo()
    }
}

private extension ViewController {
    
    func demo() {
        
        let currentStatus = WWNetWorkMonitor.shared.currnetNetworkPath().status
        wwPrint("currentStatus = \(currentStatus)")

        WWNetWorkMonitor.shared.start { path in
            wwPrint("use wifi [\(path.usesInterfaceType(.wifi))] => \(path.status)")
        }
    }
}
```
