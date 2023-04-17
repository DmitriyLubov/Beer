//
//  Label.swift
//  Beer
//
//  Created by Дмитрий Лубов on 16.04.2023.
//

import UIKit

protocol LabelFactory {
    func createLabel() -> UILabel
}

final class TitleLabelFactory: LabelFactory {
    let title: String
    let textStyle: UIFont.TextStyle
    let textColor: UIColor
    
    init(title: String, textStyle: UIFont.TextStyle, textColor: UIColor) {
        self.title = title
        self.textStyle = textStyle
        self.textColor = textColor
    }
    
    func createLabel() -> UILabel {
        let titleLabel = UILabel()
        
        titleLabel.text = title
        titleLabel.font = UIFont.preferredFont(forTextStyle: textStyle)
        titleLabel.textColor = textColor
        
        return titleLabel
    }
}
