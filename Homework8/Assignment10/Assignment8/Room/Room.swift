////
////  Room.swift
////  Assignment4
////
////  Created by karan magdani on 2/15/18.
////  Copyright © 2018 karan magdani. All rights reserved.
////
//
import Foundation
//
enum Types {
    case SingleOccupancy
    case DoubleOccupancy
}

enum IsRoomBooked{
    case Booked
    case Available
    case OneBedBooked
}
//
//
//class Room{
//    //    Name, type (single occupancy ,double occupany), price
//    static var roomNumber = 1
//    var RoomName = "Room"
//    var RoomType: Types?
//    var roomBooked: IsRoomBooked?
//    var Price: Int?
//
//    init(_ RoomType: Types, _ Price: Int){
//        let RoomNumber : String? = String(Room.roomNumber)
//        self.RoomName = self.RoomName + RoomNumber!
//        Room.roomNumber += 1
//        self.Price = Price
//        roomBooked = IsRoomBooked.Available;
//        self.RoomType = RoomType;
////        addToRoomList(self)
//    }
//
//
//
////        print("I am list of rooms " ,RoomList.first!.RoomName)
//    }
//
