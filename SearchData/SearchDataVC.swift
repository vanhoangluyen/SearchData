//
//  SearchDataVC.swift
//  SearchData
//
//  Created by Luyen on 10/31/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class SearchDataVC: UITableViewController, UISearchResultsUpdating {
    @IBOutlet weak var searchBar: UISearchBar!
    
    struct Candy {
        let category: String
        let name: String
    }
    var label: UILabel = UILabel()
    var candies = [
        Candy(category:"Chocolate", name:"Chocolate Bar"),
        Candy(category:"Chocolate", name:"Chocolate Chip"),
        Candy(category:"Chocolate", name:"Dark Chocolate"),
        Candy(category:"Hard", name:"Lollipop"),
        Candy(category:"Hard", name:"Candy Cane"),
        Candy(category:"Hard", name:"Jaw Breaker"),
        Candy(category:"Other", name:"Caramel"),
        Candy(category:"Other", name:"Sour Chew"),
        Candy(category:"Other", name:"Gummi Bear"),
        Candy(category:"Other", name:"Candy Floss"),
        Candy(category:"Chocolate", name:"Chocolate Coin"),
        Candy(category:"Chocolate", name:"Chocolate Egg"),
        Candy(category:"Other", name:"Jelly Beans"),
        Candy(category:"Other", name:"Liquorice"),
        Candy(category:"Hard", name:"Toffee Apple")]
    
    var filterCandy = [Candy]()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCandy = candies
        searchController.searchBar.placeholder = "Search Candies"
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            filterCandy = candies
        } else {
            // Filter the results
            filterCandy = candies.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterCandy.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filterCandy[indexPath.row].name
        cell.detailTextLabel?.text = filterCandy[indexPath.row].category
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Row \(indexPath.row) selected")
//    }
}


