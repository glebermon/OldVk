//
//  MyGroupsViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    

    let userVKGroupsService = UserVKGroupsService()
    var groups = [GroupsVKModel]()
    var myGroups = [Groups]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGroups = [
            Groups(name: "test1", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "test2", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!),
            Groups(name: "test3", photo: UIImage(named: "sun") ?? UIImage(named: "sun")!)
        ]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userVKGroupsService.loadUserGroupsAlamofire { [weak self] (groups, error) in
            
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
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myGroupID", for: indexPath) as! MyGroupsCell
//        let name = myGroups[indexPath.row]
//        cell.myGroupName.text = myGroups[indexPath.row].name
//        cell.myGroupIcon?.image = myGroups[indexPath.row].photo
        cell.configure(with: groups[indexPath.row])
    
        

        // Configure the cell...

        return cell
    }
    
    
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        
        // Проверяем идентификатор перехода, чтобы убедиться, что это нужный
        if segue.identifier == "addGroupID" {
            // Получаем ссылку на контроллер, с которого осуществлен переход
            let allGroupsController = segue.source as! SearchGroupViewController
            
            // Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                // Получаем группу по индексу
                let group = allGroupsController.allGroups[indexPath.row]
                let name = allGroupsController.allGroups[indexPath.row].name
                
                // Проверяем, что такой группы нет в списке
                if !(myGroups.contains { $0.name == name }) {
                    // Добавляем группы в выбранные
                    myGroups.append(group)
                    // Обновляем таблицу
                    
                    tableView.reloadData()
                }
            }
        }
       
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            УДАЛЯЕМ ГРУППУ
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    

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
