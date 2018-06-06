//: Playground - noun: a place where people can play

import UIKit


func compute (_ f: Bool,_ a: Double, _ b: Double) {
    func add (_ a: Double, _ b: Double) -> Double{
        print(a+b);
        return a+b;
    }



    func multiply (_ a : Double, _ b: Double) -> Double{
        print(a*b);
        return a*b;
    }
    if(f == true){
        add(a,b)
    }else{
        multiply(a,b)
    }
}



compute(false,10,20);
compute(true,10,20);

struct Planet{
    var name: String;
    var distanceFromPlanet : Double
    
}

let earth = Planet(name: "Earth", distanceFromPlanet: 92.96)
let mercury = Planet(name: "Mercury", distanceFromPlanet: 35.98)

print(earth)
print(mercury)

print("The sum of distances of mercury and earth is")
compute(true, earth.distanceFromPlanet, mercury.distanceFromPlanet)

print("The multiplication of distances of mercury and earth is")
compute(false, earth.distanceFromPlanet, mercury.distanceFromPlanet)




class Animal {
    func makeNoise(){}
}

protocol checkLegs{
    var numberOfLegs : Int{ get set }
    var species : String{get set }
}

class Dog : Animal, checkLegs{
    var numberOfLegs = 4;
    var species = "animal"
    override func makeNoise() {
        print("Dogs bark")
    }
}

class Cat : Animal, checkLegs{
    var numberOfLegs = 4;
    var species = "feline"
    override func makeNoise() {
        print("cats purr")
    }
}

let cat = Cat()
if(cat is Animal){
cat.makeNoise()
}
let dog = Dog()
if(dog is Animal){
dog.makeNoise()
}

let result = 5.calculates()
print("OLL ",result.sq)
print(result.sum)

extension Int {
    func calculates() -> (sq:Int, sum:Int) {
        print("I came here?")
        var number = self;
        let sqResult = self*self;
        var sumResult = 0;
        while(number > 0){
            sumResult += number
            number -= 1
        }
//        print(sumResult)
        return (sqResult, sumResult)
    }
}
