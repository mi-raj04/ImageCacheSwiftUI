//
//  ContentView.swift
//  ImageCacherGrid
//
//  Created by mind on 15/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var imageCollection:ImageCollectionViewModel
    @StateObject  private var networkMonitor = NetworkMonitor()

    
    init(imageCollection: ImageCollectionViewModel?) {
        self._imageCollection = StateObject(wrappedValue: imageCollection!)
    }
    
    private let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        if networkMonitor.isConnected {
            ScrollView{
                LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                    ForEach(imageCollection.imageCollection?.image ?? [], id: \.id) { item in
                        VStack {
                            RemoteImage(url: (item.urls?.small)!)
                                .frame(height: 300)
                        }
                    }
                }.onAppear {
                    imageCollection.getData()
                }
            } .padding()

                } else {
                    NetworkUnavailableView()
                }
    }
}

#Preview {
    ContentView(imageCollection: ImageCollectionViewModel())
}


