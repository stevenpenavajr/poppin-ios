//
//  DealsTableViewController.swift
//  Poppin
//
//  Created by Swaidner, Jonathan on 10/7/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import UIKit
import Firebase

class DealsTableViewController: UITableViewController {

    var deals = [Deal]() {
        didSet {
            cellHeights = [CGFloat].init(repeating: 0, count: deals.count)
            tableView.reloadData()
        }
    }
    
    private var cellHeights = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ContentManager.shared.delegate = self
        deals = ContentManager.shared.getDeals()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let tabBar = self.tabBarController?.tabBar else { return }
        if tabBar.alpha < 1 { setTabBarHidden(false) }
        (self.navigationController as? CustomNavigationBarController)?.updateNavigationTitle(to: "poppin.")
        if tabBarController?.tabBar.isHidden ?? false {
            self.tabBarController?.tabBar.toggleView(isVisible: true)
        }
    }

    func reloadData() {
        deals = ContentManager.shared.getDeals()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let dealCell = tableView.dequeueReusableCell(withIdentifier: DealCell.identifier, for: indexPath) as? DealCell {
            dealCell.configureCell(withDeal: deals[indexPath.row])
            if cellHeights[indexPath.row] == 0 {
                cellHeights[indexPath.row] = dealCell.sizeThatFits(CGSize(width: dealCell.bounds.width, height: .greatestFiniteMagnitude)).height
            }
            return dealCell
        }
        return UITableViewCell()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is DealDetailsTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let vc = segue.destination as? DealDetailsTableViewController
                vc?.rowSelection = indexPath.row
            }
        }
    }
    
    // Perform segue to specific deal
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: DealDetailsTableViewController.segueIdentifier, sender: indexPath)
    }
    

}
