import Foundation

//🎯1.შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)✅
enum Gender {
    case male
    case female
}

//🎯2.შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender ✅
protocol SuperBeing {
    var name: String {get}
    var strength: Int {get}
    var speed: Int {get}
    var weakness: String {get}
    var gender: Gender {get}
}
//🎯3.SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა
extension SuperBeing {
    var strength: Int {
        100
    }
    var speed: Int {
            150
    }
}
//🎯4.შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.
class Superhero: SuperBeing {
    let weakness: String
    let name: String
    let gender: Gender
    
    init(name: String, gender: Gender, weakness: String) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }
//🎯6.გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს
    func rescue(injuredPerson: String) {
        print("\(self.name) არ შეუშინდა სახიფათო სიტუაციას და \(injuredPerson) გადაარჩინა")
    }
//🎯7.გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს - “‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’
    func combat(supervilian: SuperVillian){
        print("\(self.name) შეერკინა და დაამარცხა \(supervilian.name)")
    }
}
class SuperVillian: SuperBeing {
    let weakness: String
    let name: String
    let gender: Gender

    init(name: String, gender: Gender, weakness: String) {
        self.name = name
        self.gender = gender
        self.weakness = weakness
    }
//🎯9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს -
    func attack(superhero: Superhero) {
        print("\(self.name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(superhero.name) მის შეჩერებას თუ შეძლებს")
    }
//🎯10.გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს -
    func experimentation(subject: String) {
        print("\(self.name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}
//🎯5.გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String
extension Superhero {
    var outfitColor: String {
        "Green"
    }
    var equipment: String {
        "ნაჯახი"
    }
    var vehicle: String {
        "Alfa Romeo Giulia"
    }
}
//🎯8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String
extension SuperVillian {
    var evilScheme: String {
        "ვარკეთილის გადაწვა"
    }
    var obsession: String {
        "კისტის თოფით ნადირობა"
    }
    var rivalry: String {
        "საქართველო-საბერძნეთის მატჩის ბილეთი"
    }
}

//🎯11.შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

let superheroAbasha = Superhero(name: "Gigi", gender: Gender.male, weakness: "პრიუსების შიში")
let superheroGvazo = Superhero(name: "Sandro", gender: Gender.male, weakness: "რუსი ბომჟების შიში")
let superheroTyesho = Superhero(name: "Davit", gender: Gender.male, weakness: "ტელეფონის დამტოვებელი ხალხის შიში")
let superheroJorj = Superhero(name: "Eleni", gender: Gender.female, weakness: "სისხლის სამართლის შიში")
let superheroBestSergeant = Superhero(name: "Dzindziba", gender: Gender.male, weakness: "უშიშარი")


let supervillainMachara = SuperVillian(name: "Roini", gender: Gender.male, weakness: "სიკვდილის შიში")
let supervillainGole = SuperVillian(name: "Maxo", gender: Gender.male, weakness: "სიბნელის შიში")
let supervillainMushvan = SuperVillian(name: "Haji-Giorgi", gender: Gender.male, weakness: "უშიშარი")
let supervillainMp = SuperVillian(name: "Ezgepe", gender: Gender.male, weakness: "ყველაფრის შიში")
let supervillainGabila = SuperVillian(name: "Zuka", gender: Gender.male, weakness: "ლოთების შიში")


