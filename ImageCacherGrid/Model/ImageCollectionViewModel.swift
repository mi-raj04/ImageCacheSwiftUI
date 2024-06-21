//
//  ImageCollectionViewModel.swift
//  ImageCacherGrid
//
//  Created by mind on 15/04/24.
//

import Foundation

//@Observable
class ImageCollectionViewModel:ObservableObject {
    @Published var imageCollection:ImageData? = nil
    
    init(imageCollection: ImageData? = nil) {
        self.imageCollection = imageCollection
    }
    
    func getData() {
        let url = URL(string: "https://api.unsplash.com/photos/?client_id=QqlAW2GZ-5i-6ezyr6hom7K3CcBSt3CGLo21o7e_QTQ&per_page=100")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            do {
                let obj = try JSONDecoder().decode([ImageCollection].self, from: data!)
                let objTest = ImageData(id: UUID(), image: obj)
                DispatchQueue.main.async {
                    self.imageCollection = objTest

                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
