//
//  SearchGroupCell.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class SearchGroupCell: UITableViewCell {
    
    @IBOutlet weak var vieHaAllGroups: UIView!
    @IBOutlet weak var allGroupIcon: UIImageView!
    @IBOutlet weak var allGroupName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        allGroupIcon.setRounded()
        
        vieHaAllGroups.layer.cornerRadius = vieHaAllGroups.frame.width / 2
        vieHaAllGroups.layer.shadowColor = UIColor.black.cgColor
        vieHaAllGroups.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
