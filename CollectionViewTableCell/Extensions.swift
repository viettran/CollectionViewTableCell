//
//  Extensions.swift
//  CollectionViewTableCell
//
//  Created by Viet Tran on 10/14/20.
//

import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.parentViewController
        } else {
            return nil
        }
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        return (next as? UITableView) ?? (parentViewController as? UITableViewController)?.tableView
    }
}

extension UITableView {
    func updateRowHeightsWithoutReloadingRows(animated: Bool = false) {
        let block = {
            self.beginUpdates()
            self.endUpdates()
        }
        
        if animated {
            block()
        }
        else {
            UIView.performWithoutAnimation {
                block()
            }
        }
    }
}
