//
//  LoadScreenViewController.swift
//  inetsKirillL
//
//  Created by Глеб on 26/11/2018.
//  Copyright © 2018 Глеб. All rights reserved.
//

import UIKit

class LoadScreenViewController: UIViewController {
    
    @IBOutlet weak var dot1: UIView!
    @IBOutlet weak var dot2: UIView!
    @IBOutlet weak var dot3: UIView!
    @IBOutlet weak var viewHa: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dotLoading()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        dot1.layer.cornerRadius = dot1.frame.width / 2
        dot2.layer.cornerRadius = dot1.frame.width / 2
        dot3.layer.cornerRadius = dot1.frame.width / 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func dotLoading() {
        UIView.animate(withDuration: 1, animations: {
            self.dot1.alpha = 0
            self.dot1.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                self.dot2.alpha = 0
                self.dot2.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    self.dot3.alpha = 0
                    self.dot3.alpha = 1
                    self.performSegue(withIdentifier: "VKLogin", sender: nil)
                })
            })
        })
        
        
    }

}
