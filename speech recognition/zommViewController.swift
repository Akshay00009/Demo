//
//  zommViewController.swift
//  zoom
//
//  Created by Admin on 09/11/17.
//  Copyright © 2017 Sands_technologies. All rights reserved.
//

import UIKit

class zommViewController: UIViewController
{
    var flag = 1
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var img1: UIImageView!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
         img1.isHidden = true
        img1.isUserInteractionEnabled = true
        img.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(Tap))
          let tap1 = UITapGestureRecognizer(target: self, action: #selector(Tap))
        tap.numberOfTapsRequired = 1
        
        img.addGestureRecognizer(tap)
         img1.addGestureRecognizer(tap1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool)
    {
    }
    @objc func Tap()
    {
        
        print("tapped")
        if flag == 1
        {
            flag = 0
            img.isHidden = true
            img1.isHidden = false
//            navigationController?.setNavigationBarHidden(true, animated: true)
//            navigationController?.isNavigationBarHidden = true
        }
        else if flag == 0
        {
            flag = 1
             img.isHidden = false
              img1.isHidden = true
           
          
//            navigationController?.setNavigationBarHidden(false, animated: true)
//            navigationController?.isNavigationBarHidden = false
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
