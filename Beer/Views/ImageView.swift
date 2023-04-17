//
//  ImageView.swift
//  Beer
//
//  Created by Дмитрий Лубов on 17.04.2023.
//

import UIKit

protocol ImageViewFactory {
    func createImageView() -> UIImageView
}

final class StaticImageFactory: ImageViewFactory {
    let nameImage: String
    
    init(nameImage: String) {
        self.nameImage = nameImage
    }
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: nameImage)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        return imageView
    }
}

final class BeerImage: ImageViewFactory {
    let imageData: Data
    
    init(imageData: Data) {
        self.imageData = imageData
    }
    
    func createImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = UIImage(data: imageData)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
}

final class ImageFactory {
    enum ImageType {
        case snackImage
        case recipeImage
    }
    
    func createImageView(for type: ImageType) -> UIImageView {
        switch type {
        case .snackImage:
            return StaticImageFactory(nameImage: "snacks").createImageView()
        case .recipeImage:
            return StaticImageFactory(nameImage: "recipe").createImageView()
        }
    }
    
    func createImageView(with data: Data) -> UIImageView {
        BeerImage(imageData: data).createImageView()
    }
}
