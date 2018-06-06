//
//  AddRoomViewController.swift
//  Assignment8
//
//  Created by karan magdani on 3/30/18.
//  Copyright © 2018 karan magdani. All rights reserved.
//

import UIKit

class AddRoomViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    let nextController = UIImagePickerController()
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    let roomData = [Rooms]()
    @IBOutlet weak var roomType: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextController.delegate = self
        for each in roomData{
            if let room: Rooms = each {
                SingletonLists.roomList.append(room)
            }
            
        }
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectImg(_ sender: Any) {
        
//        nextController.sourceType = .photoLibrary
        
        nextController.allowsEditing = true;
        nextController.sourceType = .photoLibrary;
//        nextController.sourceType = .camera;
//        nextController.sourceType = .photoLibrary;
        present(nextController, animated: true, completion: nil)
    }
    

    
    @IBAction func createRoom(_ sender: UIButton) {
        if myImageView.image == nil{
            let alertView = UIAlertView();
            alertView.addButton(withTitle: "OK");
            alertView.title = "Information";
            alertView.message = "Please Select an Image";
            alertView.show();
        }
        if(roomType.selectedSegmentIndex == 0){
            let room = Rooms(context: context)
            room.price = price.text!
            room.roomName = "Room" + String(SingletonLists.roomList.count + 1)
            room.roomType = Int16(Types.SingleOccupancy.hashValue)
            room.roomBooked = Int16(IsRoomBooked.Available.hashValue)
            room.roomNumber = Int16(SingletonLists.roomList.count + 1)
//            room.img = UIIm   agePNGRepresentation(myImageView.image!)
            delegate.saveContext()
            SingletonLists.addRoom(newRoom: room)
            SingletonLists.createAlert(titleText: "Room Created", messageText: "Room Created Successfully")
        }else{
            let room = Rooms(context: context)
            room.price = price.text!
            room.roomName = "Room" + String(SingletonLists.roomList.count + 1)
            room.roomType = Int16(Types.DoubleOccupancy.hashValue)
            room.roomBooked = Int16(IsRoomBooked.Available.hashValue)
            room.roomNumber = Int16(SingletonLists.roomList.count + 1)
            delegate.saveContext()
            SingletonLists.addRoom(newRoom: room)
            SingletonLists.createAlert(titleText: "Room Created", messageText: "Room Created Successfully")
            
        }
        
        
//        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            self.view.endEditing(true)
//        }
        
        
        
        
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        }
        
        
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("PLEASSEEEEEE")
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImageView.contentMode = .scaleAspectFit
        myImageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {self.dismiss(animated: true, completion: nil)
    }
}
