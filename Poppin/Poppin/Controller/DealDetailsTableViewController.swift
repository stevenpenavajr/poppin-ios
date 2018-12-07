// File: SpecificDealTableViewController.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit
import UberRides
import CoreLocation

class DealDetailsTableViewController: UITableViewController {
    
    static let segueIdentifier = "DealDetails"
    private var cellHeights: [CGFloat] = [CGFloat].init(repeating: 0.0, count: 2)
    
    var rowSelection = 0
    

    override func viewDidLoad() {
        /* Creating Uber button (just Tin Roof for now) */
        let builder = RideParametersBuilder()
        let pickupLocation = CLLocation(latitude: 38.0381, longitude: -84.5038)
        let dropoffLocation = CLLocation(latitude:38.043302, longitude: -84.501813)
        builder.pickupLocation = pickupLocation
        builder.dropoffLocation = dropoffLocation
        builder.dropoffNickname = "Tin Roof"
        builder.dropoffAddress = "303 S. Limestone"
        let rideParameters = builder.build()
        
        /* Instantiating the UberRides button */
        let uberRidesButton = RideRequestButton(rideParameters: rideParameters)
        
        super.viewDidLoad()
        
        setTabBarHidden(true)
        
        tableView.separatorStyle = .none
        
        view.addSubview(uberRidesButton)
        
        var layoutGuide = view.layoutMarginsGuide
        if #available(iOS 11, *) { layoutGuide = view.safeAreaLayoutGuide }
        
        uberRidesButton.translatesAutoresizingMaskIntoConstraints = false
        uberRidesButton.backgroundColor = UIColor.black
        uberRidesButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        uberRidesButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 20).isActive = true
        uberRidesButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -20).isActive = true
        uberRidesButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: 40).isActive = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsImageCell", for: indexPath) as? DealDetailsImageCell {
                    //config here
                    
                    if cellHeights[indexPath.row] == 0.0 {
                        cellHeights[indexPath.row] = cell.sizeThatFits(CGSize(width: cell.bounds.width, height: .greatestFiniteMagnitude)).height
                    }
                    
                    return cell
                }
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsDescriptionCell", for: indexPath) as? DealDetailsDescriptionCell {
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
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
