//
//  UIImage+LoadImage.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(with url: String, placeHolder: UIImage? = #imageLiteral(resourceName: "no-image")) {
        guard let url = URL(string: url) else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url,
                         placeholderImage: placeHolder,
                         options: .continueInBackground,
                         completed: nil)
    }
}
