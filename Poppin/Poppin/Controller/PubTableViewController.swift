// File: PubViewController.swift
// Purpose: <enter purpose>
// Date Created: 12/9/18
// Created By: Steven Penava

import Foundation
import UIKit

class PubTableViewController: UITableViewController {
    
    private var cellHeights: [CGFloat] = [CGFloat].init(repeating: 0.0, count: 4)
    var pub: Pub?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        print(pub)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PubImageCell", for: indexPath) as? PubImageCell {
                
                if cellHeights[indexPath.row] == 0.0 {
                    cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                }
                
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PubDescriptionCell", for: indexPath) as? PubDescriptionCell {
                
                if cellHeights[indexPath.row] == 0.0 {
                    cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                }
                
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PubButtonsCell", for: indexPath) as? PubButtonsCell {
                
                if cellHeights[indexPath.row] == 0.0 {
                    cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                }
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PubMapCell", for: indexPath) as? PubMapCell {
                
                if cellHeights[indexPath.row] == 0.0 {
                    cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                }
                return cell
            }
        default:
            return UITableViewCell()
        }
        
        return UITableViewCell()
    }
}
