//
//  PhotoDetailsViewController.swift
//  lnstagram
//
//  Created by Abby Juan on 1/21/16.
//  Copyright © 2016 ZhanLiang. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

   
    
    @IBOutlet weak var photoView: UIImageView!
    
    var photo: NSDictionary!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
        if let image = photo["images"]!["standard_resolution"]!!["url"] as? String {
            
            let imageUrl = NSURL(string: image)
            photoView.setImageWithURL(imageUrl!)
        }
        else {
            // No poster image. Can either set to nil (no image) or a default movie poster image
            // that you include as an asset
            photoView.image = nil
        }
        
   
        
        
        
        
        print(photo)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
