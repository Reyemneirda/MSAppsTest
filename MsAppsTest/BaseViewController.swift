//
//  BaseViewController.swift
//  MsAppsTest
//
//  Created by Adrien Meyer on 14/03/2018.
//  Copyright © 2018 Developer.Institute. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD


class BaseViewController: UIViewController {
    
    
    @IBOutlet weak var mainView: UIView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let mainBundle = Bundle.main
        if let nibName:String = NSStringFromClass(type(of: self)).components(separatedBy: ".").last
 
        {
            print(nibName) // printing the sanitized name
            
            mainBundle.loadNibNamed(nibName, owner: self, options: nil) // loading the xib file
            
            if( self.mainView != nil )
            {
                self.mainView.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
                
                self.mainView.frame = self.view.bounds
                
                self.view.addSubview(self.mainView)
            }
        }
    }
    
   

    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
}

