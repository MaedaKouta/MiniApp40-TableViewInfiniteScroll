//
//  ViewController.swift
//  MiniApp40-TableViewInfiniteScroll
//
//  Created by 前田航汰 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var number = 20

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        number
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row + 1)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if indexPath.row == self.number - 10 {
                self.number += 10
                tableView.reloadData()
            }
        }
    }

}

