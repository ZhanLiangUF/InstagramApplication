//
//  lnstagramViewController.swift
//  lnstagram
//
//  Created by Abby Juan on 1/18/16.
//  Copyright © 2016 ZhanLiang. All rights reserved.
//

import UIKit
import AFNetworking

class lnstagramViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

   
    @IBOutlet weak var tableView: UITableView!
   
   
    var photos: [NSDictionary]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
        
        
                
                
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            print("response: \(responseDictionary)")
                            self.photos = responseDictionary["data"] as! [NSDictionary]
                            self.tableView.reloadData()
                            
                            
                            
                            
                            
                            
                            
                    }
                }
        });
        task.resume()
        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if let photos = photos {
            return photos.count
        } else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath)as! PhotoCell
     
        
        let photo = photos![indexPath.row]
        
        
        if let image = photo["images"]!["standard_resolution"]!!["url"] as? String {
            
            let imageUrl = NSURL(string: image)
            cell.photoView
            .setImageWithURL(imageUrl!)
        }
        else {
            // No poster image. Can either set to nil (no image) or a default movie poster image
            // that you include as an asset
            cell.photoView.image = nil
        }
       
      
       
        
        print("row \(indexPath.row)")

        
        return cell
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


