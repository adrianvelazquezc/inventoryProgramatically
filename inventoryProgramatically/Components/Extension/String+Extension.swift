//
//  String+Extension.swift
//  moviesProgramatically
//
//  Created by Mac on 26/02/23.
//

import UIKit

public func getDecorativeTitleText(text: String, color: UIColor = .black, font: UIFont = .systemFont(ofSize: 30, weight: .bold)) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: font
    ]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}

public func getDecorativeSubtitleText(text: String, color: UIColor = .black, font: UIFont = .systemFont(ofSize: 20, weight: .medium)) -> NSMutableAttributedString {
    
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: font
    ]
    
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}
