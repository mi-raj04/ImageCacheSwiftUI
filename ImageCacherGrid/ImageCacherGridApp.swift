//
//  ImageCacherGridApp.swift
//  ImageCacherGrid
//
//  Created by mind on 15/04/24.
//

import SwiftUI

@main
struct ImageCacherGridApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(imageCollection: ImageCollectionViewModel())
        }
    }
}
