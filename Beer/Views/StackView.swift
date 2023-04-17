//
//  StackView.swift
//  Beer
//
//  Created by Дмитрий Лубов on 13.04.2023.
//

import UIKit

protocol StackViewFactory {
    func createStackView() -> UIStackView
}

final class VerticalStackViewFactory: StackViewFactory {
    let subViews: [UIView]
    let spacing: CGFloat
    
    init(subViews: UIView..., spacing: CGFloat) {
        self.subViews = subViews
        self.spacing = spacing
    }
    
    func createStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: subViews)
        
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
}
