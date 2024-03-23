import Foundation

//1. შექმენით სამი Int ტიპის ცვლადი, მიანიჭეთ მათ მნიშვნელობა და დაბეჭდეთ მათი ნამრავლი.

let number1 = 1
let number2 = 2
let number3 = 3
let multiplyOfThree = number1 * number2 * number3

print(multiplyOfThree)


//2. შექმენით int ტიპის ცვლადი, მიანიჭეთ მას მნიშვნელობა და შეამოწმეთ ეს რიცხვი ლუწია თუ კენტი ტერნარი ოპერატორით.
let number4 = 10
var isOdd = number4 % 2 != 0 ? true : false


//3. შექმენით optional String-ის ტიპის და მიანიჭეთ თქვენი სახელის მნიშვნელობა. If let-ის მეშვეობით გაუკეთეთ unwrap და მნიშვნელობა დაპრინტეთ
let myNameIs : String? = "თემური"

if let myNameIs{
    print(myNameIs)
}


/*
 4. შექმენით ცვლადი სახელად isRaining ბულეანის ტიპის და მიანიჭეთ თქვენთვის სასურველი მნიშვნელობა.
If-else-ის მეშვეობით შეამოწმეთ თუ მნიშვნელობა მიიღებს true მნიშვნელობას დაბეჭდეთ “ქოლგის
წაღება არ დამავიწყდეს”, სხვა შემთხვევაში “დღეს ქოლგა არ დამჭირდება”.
 */
var isRaining = false
if isRaining == true {
    print("ქოლგის წაღება არ დამავიწყდეს.")
}else{
    print("დღეს ქოლგა არ მჭირდება.")
}


//5. შექმენით ორი int ტიპის ცვლადი a & b და მიანიჭეთ სასურველი რიცხვები. If-else-ით შეამოწმეთ თუ a მეტია b-ზე დაბეჭდეთ “a მეტია”,  სხვა შემთხვევაში “b მეტია”
let num1 = 15
let num2 = 9
if num1 > num2{
    print("\(num1) მეტია \(num2)-ზე.")
}else{
    print("\(num2) მეტია \(num1)-ზე.")
}


//6. შექმენით მუდმივა Character ტიპის და მიანიჭეთ თქვენი სახელის პირველი ასოს მნიშვნელობა.
let firstLetterOfMyName : Character = "თ"


//7. მოცემულია ორნიშნა რიცხვი, გაიგეთ არის თუ არა ერთიდაიმავე რიცხვებისაგან შემდგარი
let bigNumber = 22
var isSameTwoDigitInNumber = bigNumber / 10 == bigNumber % 10 ? true : false


//8.აიღეთ ცვლადი numberOfMonths მიანიჭეთ მნიშვნელობა და იმის მიხედვით თუ მერამდენე თვეა
//დაბეჭდეთ ის (გაზაფხული, ზაფხული, შემოდგომა, ზამთარი) შესაბამისად.
var numberOfMonths = 1
if numberOfMonths >= 3 && numberOfMonths <= 5 {
    print("მე-\(numberOfMonths) თვე არის გაზაფხული.")
}else if numberOfMonths >= 6 && numberOfMonths <= 8 {
    print("მე-\(numberOfMonths) თვე არის ზაფხული.")
}else if numberOfMonths >= 9 && numberOfMonths <= 11 {
    print("მე-\(numberOfMonths) თვე არის შემოდგომა.")
}else if numberOfMonths == 1 || numberOfMonths == 12 || numberOfMonths == 2 {
    print("მე-\(numberOfMonths) თვე არის ზამთარი.")   // მე-1 არ არსებობს,მაგრამ მაპატიეთი :) :დ
}else {
    print("თქვენ გაქვთ არასწორი ინფორმაცია მითითებული!")
}


//9.შექმენით მთელი რიცხვის მქონე ცვლადი. თუ ეს ცვლადი იყოფა 3-ზე, დაბეჭდეთ “იყოფა 3-ზე”,
//თუ ეს ცვლადი იყოფა 4-ზე დაბეჭდეთ “იყოფა 4-ზე”, თუ იყოფა ორივეზე დაბეჭდეთ “იყოფა 3-ზე და 4-ზე”
var number5 = 15

if number5 % 3 == 0 && number5 % 4 == 0{
print("\(number5) იყოფა 3-ზე და 4-ზე.")
}else if number5 % 3 == 0 {
    print("\(number5) იყოფა 3-ზე.")
}else if number5 % 4 == 0{
    print("\(number5) იყოფა 4-ზე.")
}else {
    print("\(number5) არ იყოფა არც 4-ზე,არც 3-ზე.")
}


/*
 10. შექმენით ორი რიცხვითი ცვლადი num3, num4 და რაიმე String
ტიპის ცვლადი რომელსაც ტერნარული ოპერატორის საშუალებით მიანიჭებთ “თანაბრად დაშორებულია
ნულიდან” / “არ არის თანაბრად დაშორებული ნულიდან” შესაბამის მნიშვნელობას რომელსაც აკმაყოფილებს მოცემული ორი ცვლადი
*/
let num3 = -5
let num4 = 5

var isDistancedEqaully = abs(num3) == abs(num4) ? "თანაბრად დაშორებულია ნულიდან" : "არ არის თანაბრად დაშორებული ნულიდან"
