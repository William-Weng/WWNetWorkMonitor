//
//  WWNetWorkMonitor.swift
//  WWNetWorkMonitor
//
//  Created by William.Weng on 2024/12/4.
//

import Network

// MARK: - WWNetWorkMonitor
open class WWNetWorkMonitor: NSObject {
        
    static public let shared = WWNetWorkMonitor()
    
    private lazy var monitor: NWPathMonitor = monitorMakerForAll(queue: .global())
}

// MARK: - 公開函式
public extension WWNetWorkMonitor {
    
    /// 取得當前網路的相關訊息
    /// - Returns: NWPath
    func currnetNetworkPath() -> NWPath {
        return monitor.currentPath
    }
    
    /// [開始監控](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-nwpathmonitor-偵測網路連線-58e3c6aa2832)
    /// - Parameters:
    ///   - interfaceType: 可以指定某一種質類型
    ///   - queue: DispatchQueue
    ///   - result: (NWPath) -> Void
    func start(for interfaceType: NWInterface.InterfaceType? = nil, queue: DispatchQueue = .global(), result: @escaping ((NWPath) -> Void)) {
        
        monitor = monitorMaker(queue: queue, forInterfaceType: interfaceType)
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { (path) in result(path) }
    }
    
    /// 停止監控
    func cancel() {
        monitor.cancel()
    }
}

// MARK: - 小工具
private extension WWNetWorkMonitor {
    
    /// 產生NWPathMonitor
    /// - Parameters:
    ///   - queue: DispatchQueue
    ///   - interfaceType: NWInterface.InterfaceType?
    /// - Returns: NWPathMonitor
    func monitorMaker(queue: DispatchQueue, forInterfaceType interfaceType: NWInterface.InterfaceType?) -> NWPathMonitor {
        if let interfaceType = interfaceType { return monitorMakerForType(interfaceType, queue: queue) }
        return monitorMakerForAll(queue: queue)
    }
    
    /// 產生NWPathMonitor
    /// - Parameter queue: DispatchQueue
    /// - Returns: NWPathMonitor
    func monitorMakerForAll(queue: DispatchQueue) -> NWPathMonitor {
        
        let monitor = NWPathMonitor()
        monitor.start(queue: queue)
        
        return monitor
    }
    
    /// 產生NWPathMonitor for InterfaceType
    /// - Parameters:
    ///   - interfaceType: NWInterface.InterfaceType
    ///   - queue: DispatchQueue
    /// - Returns: NWPathMonitor
    func monitorMakerForType(_ interfaceType: NWInterface.InterfaceType, queue: DispatchQueue) -> NWPathMonitor {
        
        let monitor = NWPathMonitor(requiredInterfaceType: interfaceType)
        monitor.start(queue: queue)
        
        return monitor
    }
}
