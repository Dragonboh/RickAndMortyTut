//
//  Extentions.swift
//  RickAndMortyBP
//
//  Created by Bogdan Pankevych on 16.04.2026.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
