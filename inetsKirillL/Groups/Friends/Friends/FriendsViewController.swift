//
//  FriendsViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendsViewController: UITableViewController {
    
    let friendVKServise = FriendVKService()
//    var friends = [FriendVK]()
    var friends: Results<FriendVK>? = try? Realm().objects(FriendVK.self)

    var friendSectionsVK = [String]()
    var friendDictVK = [String : [FriendVK]]()
    
    var notificationToken: NotificationToken?

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        friendVKServise.loadFriendsAlamofire {  [weak self]  (friends, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let friends = friends, let self = self else { return }
            
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)

            try? DatabaseService.saveToRealm(items: friends, config: config, update: true)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.generateFriendDictVK()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return friendSectionsVK.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendSectionsVK[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let friendKey = friendSectionsVK[section]
        if let wordValues = friendDictVK[friendKey] {
            return wordValues.count
        }
        return 0
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendSectionsVK
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameOfFriendID", for: indexPath) as! MyFriendsCell
            let friendKey = friendSectionsVK[indexPath.section]
            if let newValue = friendDictVK[friendKey] {
            cell.myFriend.text = "\(newValue[indexPath.row].firstName) \(newValue[indexPath.row].lastName)"
            cell.friendIcon.kf.setImage(with: FriendVKService.urlForFriendVK(newValue[indexPath.row].avatar))
        }

        // Configure the cell...
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "friendsPhotos" {
            
            let friendsController = segue.source as! FriendsViewController
            let destenationVC = segue.destination as! FriendsPhotoController
            if let indexPath = friendsController.tableView.indexPathForSelectedRow {
                let friendKey = friendSectionsVK[indexPath.section]
                let friendID = friendsController.friendDictVK[friendKey]?[indexPath.row].id
                let firstName = friendDictVK[friendKey]?[indexPath.row].firstName
                let lastName = friendDictVK[friendKey]?[indexPath.row].lastName
                if let friendID = friendID,
                   let firstName = firstName,
                   let lastName = lastName {
                    destenationVC.name2 = String(friendID)
                    destenationVC.userID = String(friendID)
                    print(friendID)
                    destenationVC.screenName = firstName + " " + lastName
                }
            }
        }
    }
    
    func generateFriendDictVK() {

        guard let friends = friends else { return }
        
        for friend in friends {

            var key = ""
            if friend.lastName != "" {
                key = "\(String(describing: friend.lastName.first!))"
            } else {
                key = "\(String(describing: friend.firstName.first!))"
            }
            let lower = key.lowercased()
            
            if var friendValue = friendDictVK[lower], (friendValue.contains { $0.id == friend.id }) != true {
                friendValue.append(friend)
                friendDictVK[lower] = friendValue
            } else {
                friendDictVK[lower] = [friend]
            }
        }
        friendSectionsVK = [String](friendDictVK.keys)
        friendSectionsVK = friendSectionsVK.sorted()
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
