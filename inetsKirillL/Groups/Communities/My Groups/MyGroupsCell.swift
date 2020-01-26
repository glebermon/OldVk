//
//  MyGroupsCell.swift
//  inetsKirillL
//
//  Created by Глеб on 12/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit




class MyGroupsCell: UITableViewCell {

    
    @IBOutlet weak var vieHaMyGrpup: UIView!
    @IBOutlet weak var myGroupIcon: UIImageView!
    @IBOutlet weak var myGroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        myGroupIcon.setRounded()
        

        // ТУТ РЕАЛИЗОВАЛ ЗАКРУГЛЕНИЕ ТАК, ВО ВСЕХ ГРУППАХ ПО ДРУГОМУ
        self.layoutIfNeeded()
        myGroupIcon.setRounded()
        
        //        ДОБАВЛЯЮ ТЕНЬ
        vieHaMyGrpup.layer.cornerRadius = vieHaMyGrpup.frame.width / 2
        vieHaMyGrpup.layer.shadowColor = UIColor.black.cgColor
        vieHaMyGrpup.layer.shadowOpacity = 1

        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with group: GroupsVKModel) {
        self.myGroupName.text = "\(group.name)"
        self.myGroupIcon.kf.setImage(with: UserVKGroupsService.urlForGroupsVK(group.avatar))
    }
}
