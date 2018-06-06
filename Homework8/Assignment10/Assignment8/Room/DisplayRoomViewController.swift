//
//  DisplayRoomViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class DisplayRoomViewController: UIViewController {

    
    @IBOutlet weak var roomAmenities: UITextView!
    @IBOutlet weak var roomRating: UILabel!
    @IBOutlet weak var roomAddress: UILabel!
    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var roomPrice: UILabel!
    @IBOutlet weak var roomName: UILabel!
    var room : Rooms?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomName.text = (String(describing: room!.roomName!))
        roomPrice.text = room!.price
        roomType.text = String(describing: room?.roomType)
        roomRating.text = room?.ratings
        roomAddress.text = room?.hotelAddress
        
        roomAmenities.text = room?.amenities

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
