//
//  FriendsPhotoController.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit
import Photos
import Kingfisher

class FriendsPhotoController: UICollectionViewController {
    
    let columns : CGFloat = 2.0
    let inset : CGFloat = 8.0
    let sectionInsets = UIEdgeInsets(top: 40,
                                     left: 20,
                                     bottom: 40,
                                     right: 20)
    
    
    let userVKPhotosService = UserVKPhotosService()
    var photos = [UserVKPhotos]()
    var name2 = ""
    
    var userID = ""
    var screenName = ""
    var photoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBarController?.tabBar.isHidden = true
        
        
        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Register cell classes

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        userVKPhotosService.loadUsersPhotosAlamofire(for: userID) {  [weak self]  (photos, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let photos = photos, let self = self else { return }
            
            self.photos = photos
            
            self.title = self.screenName
                        
            self.collectionView.reloadData()
        }
    }
    
    

  /*
    override var prefersStatusBarHidden: Bool {
        return true
    }
 */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        for (key, value) in friendsPhotos {
//            if key == name2 && (friendsPhotos.contains { $0.key == name2 }) {
//                return value.photos.count
//            }
//        }

        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoId", for: indexPath) as! FriendsPhotoCell
/*
        if !cell.likedIndicator {
            cell.likeIcon.image = UIImage(named: "unliked2")
        }
*/
        cell.friendPhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[indexPath.row].url))
        
        // Configure the cell
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = photos[indexPath.item]
        photoIndex = indexPath.item
    
        performSegue(withIdentifier: "ShowPhotoPageView", sender: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPhotoPageView" {
            let destinationVC = segue.destination as! FriendPhotoViewerViewController
            destinationVC.image = (sender as? String)
            destinationVC.photos = self.photos
            destinationVC.photoIndex = self.photoIndex
            destinationVC.userID = self.userID
            let photoId = photos[photoIndex].id
            destinationVC.photoID = String(photoId)
            
        }
    }
    
    

    

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }

 /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return true
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
*/


    
}

extension FriendsPhotoController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (columns + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / columns
        print(view.frame.width)
        print(paddingSpace)
        print(columns + 1)
        print(sectionInsets.left)
        return CGSize(width: widthPerItem, height: widthPerItem)
        
//        let width = Int((collectionView.frame.width / columns) - inset)
//        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }

}


