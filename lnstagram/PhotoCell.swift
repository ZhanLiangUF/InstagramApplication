//
//  PhotoCell.swift
//  lnstagram
//
//  Created by Abby Juan on 1/18/16.
//  Copyright © 2016 ZhanLiang. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

   
    @IBOutlet weak var photoView: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
