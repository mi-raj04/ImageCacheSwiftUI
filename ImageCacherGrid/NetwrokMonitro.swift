//
//  NetwrokMonitro.swift
//  ImageCacherGrid
//
//  Created by mind on 15/04/24.
//

import SwiftUI
import Network

//@Observable
class NetworkMonitor:ObservableObject {
    @Published var networkMonitor = NWPathMonitor()
    @Published var workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied

            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
