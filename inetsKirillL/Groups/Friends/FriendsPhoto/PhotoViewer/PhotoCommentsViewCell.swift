//
//  PhotoCommentsViewCell.swift
//  inetsKirillL
//
//  Created by Глеб on 13/01/2019.
//  Copyright © 2019 Глеб. All rights reserved.
//

import UIKit

class PhotoCommentsViewCell: UITableViewCell {
    
    @IBOutlet weak var comment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
