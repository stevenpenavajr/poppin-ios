// File: SpecificDealTableViewController.swift
// Purpose: <enter purpose>
// Date Created: 11/30/18
// Created By: Steven Penava

import UIKit

class DealDetailsTableViewController: UITableViewController {
    
    static let segueIdentifier = "DealDetails"
    
    private var uberButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("Uber", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.alpha = 0.0
        btn.layer.cornerRadius = 10
        btn.clipsToBounds = true
        return btn
    }()
    
    private var cellHeights: [CGFloat] = [CGFloat].init(repeating: 0.0, count: 2)
    
    var rowSelection = 0

    override func viewDidLoad() {
        print("ROW: " , rowSelection)
        super.viewDidLoad()
        
        
        tableView.separatorStyle = .none
        
        // HIDE TAB BAR !!
        self.tabBarController?.tabBar.toggleView(isVisible: false, completion: {
            let navController = self
            let layoutGuide = navController.view.layoutMarginsGuide
            navController.view.addSubview(self.uberButton)
            self.uberButton.toggleView(isVisible: true)
            self.uberButton.translatesAutoresizingMaskIntoConstraints = false
            self.uberButton.backgroundColor = UIColor.black
            self.uberButton.heightAnchor.constraint(equalToConstant: 56.0).isActive = true
            self.uberButton.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: 20).isActive = true
            self.uberButton.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -20).isActive = true
            self.uberButton.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -20).isActive = true
        })

        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        uberButton.toggleView(isVisible: false) 
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
    

    // MARK: - Navigation

    func toggleUberButton(isVisible: Bool) {
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
