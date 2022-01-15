//
//  NewsTableViewCell.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDateLbl: UILabel!
    
    // MARK: - Func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(imageUrl: String?, title: String?, date: String?) {
        self.newsTitleLbl.text = title ?? ""
        self.newsDateLbl.text = date ?? ""
        guard let url = imageUrl else { return }
        self.newsImage.load(with: url)
    }
}
