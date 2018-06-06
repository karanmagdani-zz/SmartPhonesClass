//
//  CustomerViewCell.swift
//  Assignment8
//
//  Created by karan magdani on 3/29/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class CustomerViewCell: UITableViewCell {

    @IBOutlet weak var custName: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
