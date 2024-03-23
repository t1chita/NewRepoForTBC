import Foundation

//1.while ციკლის გამოყენებით, 1-დან 50-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.
 
var minNumberInRange = 1
let maxNumberInRange = 20
var multiplyOfOdds = 1

while minNumberInRange <= maxNumberInRange {
    if minNumberInRange % 2 != 0 {
        multiplyOfOdds *= minNumberInRange
    }
    minNumberInRange += 1
}
print(multiplyOfOdds)

//✅

//2.შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var myFirstString = "Temur"
var arrayOfString = Array(myFirstString)
var mySecondString = ""
var indexOfArray = arrayOfString.count

for _ in arrayOfString{
    mySecondString.append((arrayOfString[indexOfArray - 1]))
    indexOfArray -= 1
}
print(mySecondString)


//3.while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."
//var trafficLights = "Red"
//while trafficLights != "" {
//    switch trafficLights{
//    case "Red":
//        print("🔴")
//        trafficLights = "Yellow"
//    case "Yellow":
//        print("🌕")
//        trafficLights = "Green"
//    case "Green":
//        print("🟢")
//        trafficLights = "Red"
//    default:
//        break
//    }
//}



//4.Taylor Swift-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”
var tickets = 50

while tickets > 0 {
    
    tickets -= 1
    print("ბილეთი გაყიდულია დარჩა მხოლოდ \(tickets) რაოდენობა")
    
    if tickets == 0 {
        print("ყველა ბილეთი გაყიდულია!გელოდებით კონცერტზე.")
    }
}


//5.შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)
let myFirstArray = [1,2,3,4,5,6,3]
var secondIndex = 0
var firstIndex = 0
var weHaveSameNumbersInArray: String?

while firstIndex < myFirstArray.count - 1 {
    while secondIndex < myFirstArray.count - 1 {
    if myFirstArray[firstIndex] == myFirstArray[secondIndex + 1]{
            weHaveSameNumbersInArray = "array შეიცავს მსგავს ელემენტებს"
      break
        }else {
            weHaveSameNumbersInArray = nil
        }
    secondIndex += 1
    }
    if let weHaveSameNumbersInArray {
        print(weHaveSameNumbersInArray)
        break
    }
    firstIndex += 1
    secondIndex = firstIndex
}
if  weHaveSameNumbersInArray == nil {
    print("array-ში ყველა ელემენტი განსხვავებულია")
}



//6.დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let closureReturnsDiffOfTwoNumber: (Int, Int) -> Int = { (number1, number2)  in
    number1 - number2
}
print(closureReturnsDiffOfTwoNumber(10,5))



//7.დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

func calculateConsonantsIn(targetString:String) -> () {
    let vowels: [Character] = ["ა","ე","ი","ო","უ"," "]
    var counterForConsonants = 0
    for vowel in targetString{
        if vowels.contains(vowel){
            continue
        }
        counterForConsonants += 1
    }
    print("ამ წინადადებაში თანხმოვნების რაოდენობა არის \(counterForConsonants)")
}
calculateConsonantsIn(targetString: "მე მიყვარს ნაყინი")


//Optional

//2.დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

func calculateFactorialOf(number:Int)->(Int){
    var factorial = 1
    for firstNumber in 1...number{
        factorial *= firstNumber
    }
    return factorial
}
print(calculateFactorialOf(number: 3))


