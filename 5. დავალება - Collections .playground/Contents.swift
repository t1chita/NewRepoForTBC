import Foundation
//🎯1.დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)
func isStringMirrored(myFirstString: String)->Bool{
    var isStringMirrored: Bool
    var arrayOfMyString = Array(myFirstString)
    var mySecondString1: String = ""
    var indexForFirstArray = arrayOfMyString.count - 1
    
    
    for _ in 0...arrayOfMyString.count - 1{
        mySecondString1.append(arrayOfMyString[indexForFirstArray])
        indexForFirstArray-=1
    }
    
    if myFirstString == mySecondString1 {
        isStringMirrored = true
    } else {
        isStringMirrored = false
    }
    return isStringMirrored
}
print(isStringMirrored(myFirstString: "ანა"))
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯2.დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.
func squareOfElements(arrayOfElements: [Double]) -> [Double]{
    var indexForArray = 0
    var squaredElement:Double
    var arrayOfSquaredElements: [Double] = []
    for _ in 0..<arrayOfElements.count{
        squaredElement = pow(arrayOfElements[indexForArray],2)
        arrayOfSquaredElements.append(squaredElement)
        indexForArray += 1
    }
    return arrayOfSquaredElements
}

print(squareOfElements(arrayOfElements: [1,2,3,4]))

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯3.დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
let filterEvenNumsFromArray = { (myArray1: inout [Int]) in
    var indexForMyArray1 = 0
    
    for _ in 0...myArray1.count - 1{
        if myArray1[indexForMyArray1] % 2 == 0 {
            myArray1.remove(at: indexForMyArray1)
            continue
        }
        indexForMyArray1 += 1
    }
    print(myArray1)
}
var arr = [1,2,3,4,5]
filterEvenNumsFromArray(&arr)
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯4.დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.
func printSumOfArrayElements(myArray2: [Int],closure1: @escaping ([Int]) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now()+5){
        closure1(myArray2)
    }
    print("==========")
}
var calculateSumOfArrayElements = { (myArray2: [Int]) in
    var sumOfElements = 0
    for elementOfArray in myArray2 {
        sumOfElements += elementOfArray
    }
    print(sumOfElements)
}
var testArray = [1,2,3,4,5]
printSumOfArrayElements(myArray2: testArray, closure1: calculateSumOfArrayElements)
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯5.შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი
var contacts:[String: Int] = [
    "Abasha": 599929140,
    "Giganticha": 599123521,
    "Gvazo": 593677222,
    "Sheyila": 591965085,
    "Sulo": 599994998,
]
contacts["Kaci"] = 599861262

var searchingForKey = contacts.contains{$0.key == "Sheyila"}

if searchingForKey == true{
    print("You found the key! ☺️")
}else{
    print("Key isn't in ur dictionary.☹️ ")
}

contacts.removeValue(forKey: "Sheyila")

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯6.დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.
func returnSorted(myDictionaryKeys:[String:Int]) -> [String]{
    let sortedKeys = Array(myDictionaryKeys.keys).sorted(by:<)
    return sortedKeys
}
returnSorted(myDictionaryKeys: contacts)
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")

//🎯7.შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.

var myArrayOfReals: [Double] = [10,37.5,10.9,7.5,100,15.5,20.5,3.5,55]
var indexForArray = 0
var maxReal = myArrayOfReals[0]
for _ in 0..<myArrayOfReals.count - 1{
    if maxReal < myArrayOfReals[indexForArray + 1]{
        maxReal =  myArrayOfReals[indexForArray + 1]
    }
    indexForArray += 1
}
print(maxReal)

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//Optional
//მოცემულია Dictionary სადაც წარმოდგენილია ლელა წურწუმიას სიმღერებისა და მათი ხანგრძლივობა(წმ) მონაცემები:
let lelaWhatMovementIsThis: [String: Int] = [
    
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "ღამის სიჩუმე გაფანტე": 235,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193
    
]


//🎯1.დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში
func calculateSumOfMusicDuration(myDictionary:[String:Int]) -> (){
    var sumOfDurationInSeconds = 0
    for (_,value)in myDictionary {
        sumOfDurationInSeconds += value
    }
    var sumOfDurationInMinutes = Double(sumOfDurationInSeconds) / 60.0
    print("ლელას მუსიკების საერთო ხანგრძლივობა წამებში:" ,sumOfDurationInSeconds ,"წამი,წუთებში:", sumOfDurationInMinutes,"წუთი")
}

//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯2.დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func findMaxAndMinDurationOfSong(myDictionary2:[String:Int]) -> () {
    var maxValue: Int = Int.min
    var minValue: Int = Int.max
    var maxKey:String = ""
    var minKey:String = ""
    for (key,value) in myDictionary2 {
        if maxValue < value {
            maxValue = value
            maxKey = key
        }
    }
    print(maxKey)
    for (key,value) in myDictionary2 {
        if minValue > value {
            minValue = value
            minKey = key
        }
    }
    print(minKey)
}
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯3.დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას
func calculateAverageOfMusicsDuration(myDictionary3:[String:Int]) -> (){
    var sumOfDurationInSeconds1 = 0
    
    for (_,value) in myDictionary3 {
        sumOfDurationInSeconds1 += value
    }
    var averageDurationOfMusics = Double(sumOfDurationInSeconds1) / Double(myDictionary3.values.count)
    print("ლელას მუსიკების საშუალო ხანგრძლივობა წამებში:" ,averageDurationOfMusics)
}
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")


//🎯4.დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს
func printRandomKey(myDictionary4: [String:Int]) -> () {
    var randomMusicName = myDictionary4.keys.randomElement()
    if let randomMusicName{
        print("რენდომულად ამორჩეული მუსიკა არის: ",randomMusicName)
    }else{
        print("Dictionary is empty")
    }
}
//print("✅ყველაფერი გამართულად მუშაობს,კარგია.")
