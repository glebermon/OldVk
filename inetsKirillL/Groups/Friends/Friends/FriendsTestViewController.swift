//
//  FriendsTestViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 02/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsTestViewController: UITableViewController {
    
    let networkSevice = NetworkServiceAlamofire()
    var notificationToken: NotificationToken?
    private let friendVKServise = FriendVKService()
//    var friends = [FriendVK]()
    var friends: Results<FriendVK>? = try? Realm().objects(FriendVK.self)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationToken = friends?.observe { [weak self] changes in
            guard let self = self else { return }
            switch changes {
            case .initial(_):
                self.tableView.reloadData()
            case .update(_, let dels, let ins, let mods):
                self.tableView.applyChanges(deletions: dels, insertions: ins, updates: mods)
            case .error(let error):
                print(error.localizedDescription)
                
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        friendVKServise.loadFriendsAlamofire {  [weak self]  (friends, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let friends = friends, let self = self else { return }
            
            
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            try? DatabaseService.saveToRealm(items: friends, config: config, update: true)
            
            self.tableView.reloadData()
        }
        self.tabBarController?.tabBar.isHidden = false
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "testService", for: indexPath) as? TestFriendsViewCell,
            let friend = friends?[indexPath.row] else {  return UITableViewCell() }
        
//        cell.friend.text = "\(friends[indexPath.row])"
        cell.configure(with: friend)

        // Configure the cell...

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userPhotos",
        let destVC = segue.destination as? UserVKPhotosViewController,
        let indexPath = self.tableView.indexPathForSelectedRow {
            guard let id = friends?[indexPath.row].id,
                let firstName = friends?[indexPath.row].firstName,
                let lastName = friends?[indexPath.row].lastName else { return }
                destVC.userID = "\(id)"
                destVC.screenName = "\(firstName) \(lastName)"
        }
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
