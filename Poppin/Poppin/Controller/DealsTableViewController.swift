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

    var deals = [Deal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Deals"
        initializeFirebaseSubscription()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if tabBarController?.tabBar.isHidden ?? false {
            self.tabBarController?.tabBar.toggleView(isVisible: true)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deals.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 51.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let dealCell = tableView.dequeueReusableCell(withIdentifier: DealCell.identifier, for: indexPath) as? DealCell {
            dealCell.barNameLabel.text = deals[indexPath.row].name
            print(deals[indexPath.row].name)
            
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
