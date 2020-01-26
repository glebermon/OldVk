//
//  TestFriendsViewCell.swift
//  inetsKirillL
//
//  Created by Глеб on 02/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit
import Kingfisher

class TestFriendsViewCell: UITableViewCell {
    
    @IBOutlet weak var friend: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(with friend: FriendVK) {
        self.friend.text = "\(friend.firstName) \(friend.lastName)"
        self.avatar.kf.setImage(with: FriendVKService.urlForFriendVK(friend.avatar))
    }

}
