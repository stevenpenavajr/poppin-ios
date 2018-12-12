// File: DealDetailsTableViewController.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import CoreLocation
import UberRides
import UIKit

class DealDetailsTableViewController: UITableViewController {
    
    static let segueIdentifier = "DealDetails"
    
    private var cellHeights: [CGFloat] = [CGFloat].init(repeating: 0.0, count: 3)
    internal var uberRidesButton: RideRequestButton?
    
    var deal: Deal?
    
    let whiteView = UIView()
    
    

    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarHidden(true)
        
        tableView.separatorStyle = .none
        tableView.contentInset = .init(top: 0, left: 0, bottom: 50.0, right: 0)
        tableView.scrollIndicatorInsets = .init(top: 0, left: 0, bottom: 20, right: 0)
        
        self.view.addSubview(whiteView)
        
        setupWhiteView()
        
        setupUberButton()
    }
    
    func setupWhiteView() {
        whiteView.backgroundColor = .white
        
        var layoutGuide = view.layoutMarginsGuide
        if #available(iOS 11, *) { layoutGuide = view.safeAreaLayoutGuide }
        
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        whiteView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 0).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: 0).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 150).isActive = true
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsImageCell", for: indexPath) as? DealDetailsImageCell {
                    guard let deal = deal else { return UITableViewCell() }
                    cell.configureCell(withDeal: deal)
                    
                    if cellHeights[indexPath.row] == 0.0 {
                        cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                    }
                    return cell
                }
            
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsDescriptionCell", for: indexPath) as? DealDetailsDescriptionCell {
                    guard let deal = deal else { return UITableViewCell() }
                    cell.configureCell(withDeal: deal)
                    
                    if cellHeights[indexPath.row] == 0.0 {
                        cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                    }
                    return cell
                }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsMapCell", for: indexPath) as? DealDetailsMapCell {
                guard let deal = deal else { return UITableViewCell() }
                guard let pub = deal.pub else { return UITableViewCell() }
                cell.configureCell(withPub: pub)
                
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "PubSegue", sender: self)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pubVC = segue.destination as? PubTableViewController {
            pubVC.pub = deal?.pub
        }
    }
    

}
