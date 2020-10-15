//
//  ViewController.swift
//  CollectionViewTableCell
//
//  Created by Viet Tran on 10/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        tableView.register(UINib(nibName: String(describing: CollectionViewTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CollectionViewTableViewCell.self))
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        if indexPath.row == 5 {
            cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewTableViewCell.self)) as? CollectionViewTableViewCell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
            cell?.textLabel?.text = "Row \(indexPath.row)"
        }
        
        return cell ?? UITableViewCell()
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
