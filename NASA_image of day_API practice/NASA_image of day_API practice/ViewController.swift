//
//  ViewController.swift
//  NASA_image of day_API practice
//
//  Created by Marie Park on 11/16/16.
//  Copyright © 2016 Marie Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.getDataFromAPI { (planetInfo) in
            APIClient.getImage(at: planetInfo.url, completion: { (success, image) in
                
                if success == true {
                    
                    print ("success")
                    
                    DispatchQueue.main.async {
                        self.ImageView.image = image
                        
                    }
                    
                }
                
                
            })
            
            
            
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

