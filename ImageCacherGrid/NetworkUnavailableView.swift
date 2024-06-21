//
//  NetworkUnavailableView.swift
//  ImageCacherGrid
//
//  Created by mind on 15/04/24.
//

import SwiftUI

struct NetworkUnavailableView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView(
                "No Internet Connection",
                systemImage: "wifi.exclamationmark",
                description: Text("Please check your connection and try again.")
            )
        } else {
            VStack {
                Text("No Internet Connection")
                    .padding()
                Image(systemName: "wifi.exclamationmark")
                    .padding()
                Text("Please check your connection and try again.")
            }
        }
    }
}

#Preview {
    NetworkUnavailableView()
}
