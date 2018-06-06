//: Playground - noun: a place where people can play

import UIKit


//var str = "Hello, playground"
//VARIABLES
var num1 = 15
var num2 = 5
var sum = num1 + num2
var mul = num1 * num2
var sub = num1 - num2
var div = num1 / num2

var str = "Hello"
var com = ","
var str1 = "World"

var concat = str + com + str1;

//FUNCTIONS
func sum(num1: Double, num2: Double ) -> Double{
    return num1 + num2;
}

func subtract(_ num1: Int, _ num2: Int) -> Int{
    return num1 - num2;
}

func multiply(num1:Float, num2: Float) -> Float{
    return num1 * num2;
}

print(sum(num1:10.00,num2:20.00))
print(subtract(20,10))
print(multiply(num1:5,num2:5))


//Arrays
var arrayOfStrings = [String]()
let doublesArray : [Double] = [1.0,2.0,3.0,4.0]
var doublesArray1 : [Double] = [1.0,2.0,3.0,4.0]
var listOfNames = ["adam","andy","mike","dave","john"]
arrayOfStrings.append("Watch")
arrayOfStrings.append("out")
arrayOfStrings.append("Swift")

doublesArray1.append(5.0)
doublesArray1.append(6.0)
doublesArray1.append(7.0)

var num = arc4random_uniform(8)
var numint = Int(num);
print(num)
print(doublesArray1)
doublesArray1.remove(at: numint);
print(doublesArray1)
listOfNames.removeAll()

//Swift Loops
var oddNumbers = [Int]()
var sums = [Int]()
var index = 0;
for index in 0...100{
    var ind = index;
    if(index % 2 != 0){
        oddNumbers.append(index)
    }
}
print(oddNumbers)

for i in 0..<oddNumbers.count {
    sums.append(Int(oddNumbers[i]) + 5)
}
var j = 0
while(j < sums.count){
    print("the sum is \(sums[j]) and iteration is \(j)")
    j+=1;
}

//SWIFT Conditions
func checkExpiry(milk: String, egg: String ){
    dateFormatter.dateFormat = "MM/dd/yyyy"
    let milkDate = dateFormatter.date(from: milk)
    let eggDate = dateFormatter.date(from: egg)
    let date = Date();
    var boughtMilk = daysBetween(start: date, end: milkDate!)
    var boughtEgg = daysBetween(start: date, end: eggDate!)
    var expiryMilk = boughtMilk + 18;
    var expiryEgg = boughtEgg + 18;
//    print(expiryEgg)
//    print(expiryMilk)
    if(expiryMilk < 0 ){
        print("Please throw away the milk")
    }
    if(expiryEgg < 0){
        print("Please throw away the eggs")
    }
}

func daysBetween(start: Date, end: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: start, to: end).day!
}

let dateFormatter = DateFormatter()
dateFormatter.dateStyle = .short

checkExpiry(milk: "01/15/2018", egg: "01/15/2018")


func checkIdentical(_ first:Int, _ second:Int, _ third:Int){
    if(first == second || second == third || third == first){
        print("atleast two out of three are identical")
    }else{
        print("none are")
    }
}

checkIdentical(10, 20, 20)

//Dictionaries

