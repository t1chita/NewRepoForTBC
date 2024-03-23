import Foundation

//🎯1)  დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და
//აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე
//ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
//დიდ და პატარა ასოებსაც ვითვალისწინებთ.

func isStringMadeWithSameChars(firstString: String, secondString: String) -> Bool{
    var isStringMadeWithSameChars: Bool = true
    if firstString.sorted() == secondString.sorted(){
        isStringMadeWithSameChars = true
    }else{
        isStringMadeWithSameChars = false
    }
    return isStringMadeWithSameChars
}
let stringOne = "abc"
let stringTwo = "bca"
print(isStringMadeWithSameChars(firstString: stringOne, secondString: stringTwo))
print("=============")
let strOne = "Abc"
let strTwo = "abc"
print(isStringMadeWithSameChars(firstString: strOne, secondString: strTwo))

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")

//🎯2) დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
func removeNeedlessSpacesIn(myString: String) -> String{
    var arrayForString = Array(myString)
    var index = 0
    for _ in 0..<arrayForString.count - 1{
        if arrayForString[index] == " " && arrayForString[index + 1] == " "{
            arrayForString.remove(at: index)
            continue
        }
        index += 1
    }
    let stringForReturn = String(arrayForString)
    return stringForReturn
}
var testString1 = "a   b  c"
var testString2 = "   a"
print(removeNeedlessSpacesIn(myString: testString1))
print("=======")
print(removeNeedlessSpacesIn(myString: testString2))

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")
//🎯3) დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს),
//გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ.

func sumOfNumbersInString(string: String) -> Int {
    let stringArray = string.components(separatedBy: CharacterSet.decimalDigits)
    var sumOfNumbers = 0
    for item in stringArray {
        if let number = Int(item) {
            sumOfNumbers += number
        }
    }
    return sumOfNumbers
}
sumOfNumbersInString(string: "asdf1b0b20c30")

