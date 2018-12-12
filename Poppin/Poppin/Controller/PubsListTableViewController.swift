//
//  PubsListTableViewController.swift
//  Poppin
//
//  Created by Blake Swaidner on 12/12/18.
//  Copyright © 2018 MoBamba. All rights reserved.
//

import UIKit

class PubsListTableViewController: UITableViewController {
 
    var pubs: [Pub] = [Pub]()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pubs = ContentManager.shared.getPubs()
    }
    
    // MARK: - Tableview
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pubs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PubsListCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = pubs[indexPath.row].name ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("BLALE")
        performSegue(withIdentifier: "PubSegue", sender: pubs[indexPath.row])
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PubSegue", let pubVC = segue.destination as? PubTableViewController {
            pubVC.pub = sender as? Pub
        }
    }
    
}
