//
//  BookingViewCell.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class BookingViewCell: UITableViewCell {
    @IBOutlet weak var bookingName: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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


