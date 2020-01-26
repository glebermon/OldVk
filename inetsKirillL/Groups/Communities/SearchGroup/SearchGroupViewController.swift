//
//  SearchGroupViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit
import Kingfisher

class SearchGroupViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let groupVKSearchSevice = GroupVKSearchSevice()
    
    var groups = [SearchGroupsVKModel]()
    var allGroups = [Groups]()
    var filteredGroups = [SearchGroupsVKModel]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Groups"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        allGroups = [
            Groups(name: "Dogs", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Cats", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Ferrets", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Food", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Films", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Swift programming language", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "HTML, CSS", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "Nature", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "test1", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
        ]
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groupVKSearchSevice.loadSearchGroupsVKAlamofire { [weak self] (groups, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let groups = groups, let self = self else { return }
            
            self.groups = groups
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if isFiltering() {
            return filteredGroups.count
        }
            return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupsID", for: indexPath) as! SearchGroupCell
        let name : String
        if isFiltering() {
            name = filteredGroups[indexPath.row].name
            cell.allGroupIcon.kf.setImage(with: GroupVKSearchSevice.urlForSearchGroupsVK(filteredGroups[indexPath.row].avatar))
        } else {
            name = groups[indexPath.row].name
            cell.allGroupIcon.kf.setImage(with: GroupVKSearchSevice.urlForSearchGroupsVK(groups[indexPath.row].avatar))
        }
        
        cell.allGroupName.text = name
        //cell.allGroupIcon.kf.setImage(with: GroupVKSearchSevice.urlForSearchGroupsVK(groups[indexPath.row].avatar))

        // Configure the cell...

        return cell
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredGroups = groups.filter({( group : SearchGroupsVKModel) -> Bool in
            return group.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchGroupViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
