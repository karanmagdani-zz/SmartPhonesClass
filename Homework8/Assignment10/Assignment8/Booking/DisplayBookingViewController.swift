//
//  DisplayBookingViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class DisplayBookingViewController: UIViewController {
//    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var customer: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var toDate: UILabel!
    @IBOutlet weak var fromDate: UILabel!
        var booking : Bookings?
//    @IBOutlet weak var bookingName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        bookingName.text = String(booking!.bookingName!)
        room.text = String(describing: booking!.room!.roomName!)
        fromDate.text = String(describing: booking!.fromDate!)
        toDate.text = String(describing: booking!.toDate!)
//        roomType.text = booking?.room?.roomType!
        customer.text = booking?.customer?.name

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
