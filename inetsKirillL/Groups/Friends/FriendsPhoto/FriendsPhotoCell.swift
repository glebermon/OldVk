//
//  FriendsPhotoCell.swift
//  inetsKirillL
//
//  Created by Глеб on 15/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class FriendsPhotoCell: UICollectionViewCell {
    
    var likedIndicator = false
    
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var likeCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
/*
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(onTap))
//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(onTap2))
        
//        friendPhoto.addGestureRecognizer(tap2)
//        friendPhoto.isUserInteractionEnabled = true
  

        likeIcon.addGestureRecognizer(tap1)
        likeIcon.isUserInteractionEnabled = true
        
    }
    
    @objc func onTap() {
        
        likedIndicator = !likedIndicator

        //        МОЖНО БЫЛО БЫ COUNT БРАТЬ КАК ОБЩЕЕ ЧИСЛО ЛАЙКОВ, НО У МЕНЯ НЕТ ЭТО ОБЩЕГО ЧИСЛА.
        var count = 1
        if likedIndicator {
            
            UIView.transition(with: likeIcon,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.likeIcon.image = UIImage(named: "liked2")
            })
            likeCounter.text = String(count)
            likeCounter.textColor = .red
        } else {
            
            UIView.transition(with: likeIcon,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.likeIcon.image = UIImage(named: "unliked2")
            })
            count = count - 1
            likeCounter.text = String(count)
            likeCounter.textColor = .black

        }
    }
    
//    @objc func onTap2 () {
//        
//        let scaleDown = CASpringAnimation(keyPath: "transform.scale")
//        scaleDown.beginTime = CACurrentMediaTime()
//        scaleDown.fromValue = 0.9
//        scaleDown.toValue = 1
//        scaleDown.initialVelocity = 230
//        scaleDown.damping = 4
//        scaleDown.stiffness = 200
//        scaleDown.mass = 0.4
//        scaleDown.duration = 0.4
//        
//        friendPhoto.layer.add(scaleDown, forKey: nil)
//
 */
    }

}


