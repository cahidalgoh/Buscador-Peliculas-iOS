//
//  UIImageViewExtensions.swift
//  Recipes-Test
//
//  Created by Carlos Hidalgo on 16/07/25.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }

    func loadImageFromURLString(urlString: String) {
        self.loadImageFromURL(url: URL(string: urlString)!)
    }
}
