//
//  NewsVC+UITableViewDelegate.swift
//  NYTimes
//
//  Created by Mohamed Abdul-Raouf on 15/01/2022.
//

import UIKit

extension NewsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.router.navigateToNewsDetails(self, popularNews: self.viewModel.newsSubject.value[indexPath.row])
    }
}
