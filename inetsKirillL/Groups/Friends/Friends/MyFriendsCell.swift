//
//  MyFriendsCell.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
    
    @IBOutlet weak var vieHa: UIView!
    @IBOutlet weak var friendIcon: UIImageView!
    @IBOutlet weak var myFriend: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myFriend.setNeedsLayout()
        friendIcon.setNeedsLayout()
//        ДЕЛАЮ ИКОНКУ КРУГЛОЙ
        friendIcon.setRounded()
//        ДОБАВЛЯЮ ТЕНЬ

        vieHa.layer.cornerRadius = vieHa.frame.width / 2
        vieHa.layer.shadowColor = UIColor.black.cgColor
        vieHa.layer.shadowRadius = 2
        vieHa.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with friend: FriendVK) {
        self.myFriend.text = "\(friend.firstName) \(friend.lastName)"
        self.friendIcon.kf.setImage(with: FriendVKService.urlForFriendVK(friend.avatar))
    }
    
}

