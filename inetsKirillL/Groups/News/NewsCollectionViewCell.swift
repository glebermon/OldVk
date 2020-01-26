//
//  NewsCollectionViewCell.swift
//  inetsKirillL
//
//  Created by Глеб on 24/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var newText: UILabel!
    @IBOutlet weak var newImaga: UIImageView!
    @IBOutlet weak var postLike: UIImageView!
    @IBOutlet weak var postLikeCounter: UILabel!
    @IBOutlet weak var repostButton: UIImageView!
    @IBOutlet weak var repostCounter: UILabel!
    @IBOutlet weak var viewsNumberImg: UIImageView!
    @IBOutlet weak var viewsCounter: UILabel!
    @IBOutlet weak var comments: UIImageView!
    
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
}
