//
//  ListStoreViewExtension.swift
//  frogtest
//
//  Created by Alfredo Tochon on 4/8/22.
//

import Foundation
import UIKit

extension StoreViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.currentCount ?? 0
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentCount = viewModel?.currentCount ?? 0
        if(indexPath.row == currentCount - 1) {
            if(viewModel!.shouldFetchNextPage) {
                viewModel!.pageNumber += 1
                setupViewModelObserver()
                self.tableView.tableFooterView?.isHidden = false
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoreTableCell.self)) as? StoreTableCell {
            let pos = indexPath.row
            cell.setupCell(name: viewModel!.getStoreTitle(index: pos), address: viewModel!.storeAddress(index: pos))
            return cell
        }
        return UITableViewCell()
    }

}
