import Foundation
//🎯1.შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ
//ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე
//სამუშაოა თუ დასვენების.

enum WeekDay {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
func isDayWorkOrRest(day: WeekDay) {
    var isRestDay: Bool = true
    switch day {
    case WeekDay.Saturday:
        isRestDay
    case WeekDay.Sunday:
        isRestDay
    default:
        isRestDay = false
    }
    isRestDay ? print(day," is rest day.") : print(day," is not rest day.")
}

isDayWorkOrRest(day: WeekDay.Monday)
print(WeekDay.Monday)
isDayWorkOrRest(day: WeekDay.Sunday)


//🎯2.შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების
//დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი
//GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია
//ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს.
enum GialaSquad: Int{
    case TsigroviManto = 500
    case MoshishvlebuliMkerdi = 400
    case TuGapatio = 300
    
    var priceOfFanClubs: Int{
        switch self{
        case .TsigroviManto:
            return self.rawValue
        case .MoshishvlebuliMkerdi:
            return self.rawValue
        case .TuGapatio:
            return self.rawValue
        }
    }
    func printFanClubPrice() -> () {
        return print(self,"fun club's entry price is",priceOfFanClubs)
    }
}
var newMember = GialaSquad.TsigroviManto
newMember.printFanClubPrice()


// 🎯3.შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
    
enum Weather  {
    case Sunny(Int)
    case Cloudy(Int)
    case Rainy(Int)
    case Snowy(Int)
}

func recommendationAboutClothes(weather: Weather){
    switch weather{
    case .Sunny(let celsiusOfSunnyDay):
        if celsiusOfSunnyDay >= 20 && celsiusOfSunnyDay <= 40 {
            print("დღეს არის \(celsiusOfSunnyDay) ცელსიუსი,ჩაიცვით მოკლე მკლავიანი მაისური.")
        }else{
            print("ცელსიუსი არასწორადაა მითითებული,ცადეთ თავიდან.")
        }
    case .Cloudy(let celsiusOfCloudyDay):
        if celsiusOfCloudyDay >= 10 && celsiusOfCloudyDay < 20{
            print("დღეს არის \(celsiusOfCloudyDay) ცელსიუსი,ჩაიცვით თბლიად.")
        }else{
            print("ცელსიუსი არასწორადაა მითითებული,ცადეთ თავიდან.")
        }
    case .Rainy(let celsiusOfRainyDay):
        if celsiusOfRainyDay >= 0 && celsiusOfRainyDay < 10{
            print("დღეს არის \(celsiusOfRainyDay) ცელსიუსი,ჩაიცვით ქურთუკი და წაიღეთ ქოლგა.")
        }else{
            print("ცელსიუსი არასწორადაა მითითებული,ცადეთ თავიდან.")
        }
    case .Snowy(let celsiusOfSnowyDay):
        if celsiusOfSnowyDay >= -20  && celsiusOfSnowyDay < 0{
            print("დღეს არის \(celsiusOfSnowyDay) ცელსიუსი,წადით ბაკურიანში და კარგად ისრიალეთ.")
        }else{
            print("ცელსიუსი არასწორადაა მითითებული,ცადეთ თავიდან.")
        }
    }
}


//🎯4.შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.
struct Kanye{
    let album: String
    let releaseYear: Int
}

let whoGonStopMe = Kanye(album: "Watch The Throne(Deluxe)", releaseYear: 2011)
let cantTellMeNothing = Kanye(album: "Graduation", releaseYear: 2007)
let violentCrimes = Kanye(album: "ye", releaseYear: 2018)
let backToMe = Kanye(album: "VULTURES 1", releaseYear: 2024)

var infoAboutKanyesAlbums = [whoGonStopMe,cantTellMeNothing,violentCrimes,backToMe]

func youngerAlbumsThanTarget(ArrayOfKanyesSongs: [Kanye], targetYear: Int) -> [String]{
    var arrayForAlbums: [String] = []
    for element in ArrayOfKanyesSongs{
        if element.releaseYear > targetYear{
            arrayForAlbums.append(element.album)
        }
    }
    print(arrayForAlbums)
    return arrayForAlbums
}
youngerAlbumsThanTarget(ArrayOfKanyesSongs: infoAboutKanyesAlbums, targetYear: 2009)


//🎯5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა.

@propertyWrapper
struct InitializerStruct {
    lazy var myString: String = self.myInitializator()
    var myInitializator: () -> String
    
    init(initClosure: @autoclosure @escaping () -> String){
        self.myInitializator = initClosure
    }
    var wrappedValue: String{
        mutating get {
            return myString
        }
    }
}

struct structForTest {
    @InitializerStruct(initClosure: "lazy ინიციალიზებულია")
    var cachedData: String
}
var someData = structForTest()
print(someData.cachedData)


