//
//  FriendPhotoViewerViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 30/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit
import Kingfisher

class FriendPhotoViewerViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let photoCommentsSevice = UserVKPhotosCommentsService()
    
    @IBOutlet weak var fullSizePhoto: UIImageView!
    @IBOutlet weak var likesCount: UIBarButtonItem!
    @IBOutlet weak var commetsCount: UIBarButtonItem!
    
    
    var comments = [PhotoCommentsModel]()
    var photos = [UserVKPhotos]()
    var image : String!
    var photoIndex = 0
    var userID = ""
    var photoID = ""
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
        likesCount.title = "Likes: \(photos[photoIndex].likes)"
        
        photoCommentsSevice.loadUsersPhotoCommentsAlamofire(for: photoID, for: userID) { [weak self] (comments, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let comments = comments, let self = self else { return }
            
            self.comments = comments
            self.commetsCount.title = "Comments: \(comments.count)"
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullSizePhoto.isUserInteractionEnabled = true
        fullSizePhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[photoIndex].url))
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        fullSizePhoto.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.left
        fullSizePhoto.addGestureRecognizer(swipeLeft)

        // Do any additional setup after loading the view.
        
    }
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        let swipeGesture = sender
        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
                
            let scaleDown = CASpringAnimation(keyPath: "transform.scale")
            scaleDown.beginTime = CACurrentMediaTime()
            scaleDown.fromValue = 1
            scaleDown.toValue = 0.8
            scaleDown.duration = 0
                
            fullSizePhoto.layer.add(scaleDown, forKey: nil)
                
            if photoIndex > 0 {
                photoIndex -= 1
                fullSizePhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[photoIndex].url))
                likesCount.title = "Likes: \(photos[photoIndex].likes)"
                photoID = String(photos[photoIndex].id)
                commetsCount.title = "Comments: \(comments.count)"
                viewWillAppear(true)

            } else {
                photoIndex = photos.count - 1
                fullSizePhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[photoIndex].url))
                likesCount.title = "Likes: \(photos[photoIndex].likes)"
                photoID = String(photos[photoIndex].id)
                commetsCount.title = "Comments: \(comments.count)"
                viewWillAppear(true)


            }
                
        case UISwipeGestureRecognizer.Direction.left:
            
            let scaleDown = CASpringAnimation(keyPath: "transform.scale")
            scaleDown.beginTime = CACurrentMediaTime()
            scaleDown.fromValue = 1
            scaleDown.toValue = 0.8
            scaleDown.duration = 0
            
            fullSizePhoto.layer.add(scaleDown, forKey: nil)
                
                
                

            if photoIndex < (photos.count - 1) {
                photoIndex += 1
                fullSizePhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[photoIndex].url))
                likesCount.title = "Likes: \(photos[photoIndex].likes)"
                photoID = String(photos[photoIndex].id)
                commetsCount.title = "Comments: \(comments.count)"
                viewWillAppear(true)

            } else {
                photoIndex = 0
                fullSizePhoto.kf.setImage(with: UserVKPhotosService.urlForUserVKPhoto(photos[photoIndex].url))
                likesCount.title = "Likes: \(photos[photoIndex].likes)"
                photoID = String(photos[photoIndex].id)
                commetsCount.title = "Comments: \(comments.count)"
                viewWillAppear(true)

            }
        default:
            break
            
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "watchComments" {
            let destVC = segue.destination as! PhotoCommentsTableViewController
            destVC.comments = self.comments
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
