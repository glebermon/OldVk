//
//  NewsViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 24/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class NewsViewController: UICollectionViewController {
    
    var testNews = [News]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testNews = [
            News(text: "If you’ve ever created custom table view cells before.", img: UIImage(named: "deadPool")!),
            News(text: "If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to calculate, manually, the height of every label, image view, text field — and everything else within the cell. Frankly, this approach is mind-boggling and error prone. In this self-sizing table view cells tutorial, you’ll learn how to create and size table view cells dynamically to fit their contents. You might be thinking: “That’s going to take a lot of work!” Nope! :]", img: UIImage(named: "deadPool")!),
            News(text: "If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to calculate, manually, the height of every label, image view, text field — and everything else within the cell. Frankly, this approach is mind-boggling and error prone. In this self-sizing table view cells tutorial, you’ll learn how to create and size table view cells dynamically to fit their contents. You might be thinking: “That’s going to take a lot of work!” Nope! :]If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to calculate, manually, the height of every label, image view, text field — and everything else within the cell. Frankly, this approach is mind-boggling and error prone. In this self-sizing table view cells tutorial, you’ll learn how to create and size table view cells dynamically to fit their contents. You might be thinking: “That’s going to take a lot of work!” Nope! :]If you’ve ever created custom table view cells before, chances are good that you have spent a lot of time sizing table view cells in code. You may even be familiar with having to calculate, manually, the height of every label, image view, text field — and everything else within the cell. Frankly, this approach is mind-boggling and error prone. In this self-sizing table view cells tutorial, you’ll learn how to create and size table view cells dynamically to fit their contents. You might be thinking: “That’s going to take a lot of work!” Nope! :]", img: UIImage(named: "deadPool")!)
        
        ]
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout,
            let collectionView = collectionView {
            let w = collectionView.frame.width
//            flowLayout.estimatedItemSize = CGSize(width: w, height: 200)
            flowLayout.estimatedItemSize = CGSize(width: w, height: 600)

        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

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
        return testNews.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCollectionViewCell
        
        cell.newText.text = testNews[indexPath.row].newTxt
        cell.newImaga.image = testNews[indexPath.row].newImg
        cell.postLike.image = UIImage(named: "liked2")!
        cell.repostButton.image = UIImage(named: "repost")!
        cell.viewsNumberImg.image = UIImage(named: "eye")
        cell.comments.image = UIImage(named: "comments")
        
    
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

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
