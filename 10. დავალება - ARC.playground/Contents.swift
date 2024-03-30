import Foundation

class Homework {
    let subject: String
    var student: Student?
    
    init(subject: String, student: Student? = nil) {
        self.subject = subject
        self.student = student
    }
    deinit{
        print("\(self.subject) is deallocated🔴")
    }
}

class Student {
    let name: String
    var homework: Homework?
    
    init(name: String, homework: Homework? = nil) {
        self.name = name
        self.homework = homework
    }
    deinit{
        print("\(self.name) is deallocated🔴")
    }
}

var homeworkOfMath: Homework? = Homework(subject: "Math")
var studentNiko: Student? = Student(name: "Niko")

homeworkOfMath?.student = studentNiko
studentNiko?.homework = homeworkOfMath
//ციკლის გაწყვეტა მექანიკურად
studentNiko?.homework = nil
homeworkOfMath?.student = nil
// ობიექტების საბოლოო გაუქმება
studentNiko = nil
homeworkOfMath = nil


//🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
protocol CharacterizableProfessionally {
    var rank: Ranks {get set}
    var shootingRank: Int {get set}
    var physicalActivityRank: Int {get set}
    var currentCourse: coursesForPromote? {get set}
}
enum Ranks {
    case Sergeant,StaffSergeant,SergeantFirstClass
    case MasterSergeant,FirstSergeant,SergeantMajor
    case CommandSergeantMajor,SergeantMajorOfTheArmy
}

class Sergeants: CharacterizableProfessionally {
    let name: String
    var rank: Ranks
    var shootingRank: Int
    var physicalActivityRank: Int
    var currentCourse: coursesForPromote?

    init(name: String, rank: Ranks, shootingRank: Int, physicalActivityRank: Int, currentCourse: coursesForPromote? = nil) {
        self.name = name
        self.rank = rank
        self.shootingRank = shootingRank
        self.physicalActivityRank = physicalActivityRank
        self.currentCourse = currentCourse
    }
    deinit {
        print("🔴\(self.name) is deallocated")
    }
}

class coursesForPromote {
    var currentCourseName: String
    weak var sergeant: Sergeants?
    
    init(currentCourseName: String) {
        self.currentCourseName = currentCourseName
    }
    deinit {
        print("🔴\(self.currentCourseName) is deallocated")
    }
}
//პრიველი strong რეფერენსი  sergeantBekauri-ს და პირველ ობიექტს შორის
var sergeantBekauri: Sergeants? = Sergeants(name: "Imeda", rank: .MasterSergeant, shootingRank: 3, physicalActivityRank: 1)
//პირველი strong რეფერენსი courseForPromote-ს და მეორე ობიექტს შორის
var courseForPromote: coursesForPromote? = coursesForPromote(currentCourseName: "Promote to \(Ranks.FirstSergeant)")
//მეორე strong რეფერენსი,რომელიც მიმრათულია მეორე ობიექტზე sergeantBekauri-ს property: currentCourse-დან.
sergeantBekauri?.currentCourse = courseForPromote
//weak რეფერენსი,რომელიც მიმართულია პირველ ობიექტზე courseForPromote-ს property-ს: sergeant-დან.
courseForPromote?.sergeant = sergeantBekauri
//ვანილებთ პირველ რეფერენსს და უქმდება პირველი ობიექტი,რადგან ერთადერთი strong რეფერენსი იყო მასზე მითითებული და ამასთან ერთად გაუქმდა weak რეფერენსი,რადგან ობიექტი აღარ არსებობს,რომელზეც ის იყო მითითებული.
sergeantBekauri = nil
sergeantBekauri
courseForPromote
//გაუქმდა ორივე ობიექტი.
courseForPromote = nil
//🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴🔴
class Lector {
    let name: String
    weak var course: Course?
    
    lazy var DetailsAboutLector: () -> String = {
        [unowned self] in
        if let course = self.course?.name {
            return "\(self.name) is a reader of \(course)"
        }else {
            return "\(self.name) doesn't a reader of anything"
        }
    }
    
    init(name: String, course: Course? = nil) {
        self.name = name
        self.course = course
    }
    deinit{
        print("🔴\(name) is deallocated🔴")
    }
}

class Course {
     let name: String
     var lector: Lector?
    
    init(name: String, lector: Lector? = nil) {
        self.name = name
        self.lector = lector
    }
    
    deinit{
        print("🔴\(name) is deallocated🔴")
    }
}



var lectorAbashidze: Lector? = Lector(name: "Dodo")
var courseOfUIUX: Course? = Course(name: "Course Of UI UX")


lectorAbashidze?.course = courseOfUIUX
courseOfUIUX?.lector = lectorAbashidze

//ვიძახებთ და ვინახავთ DetailsAboutLector closure-ს return -ს ახალ ცვლადში და თან ვუკეთებთ unwrap ს
var detailsAboutLector = lectorAbashidze!.DetailsAboutLector()
//ახალ ცვლადს ვპრინტავთ
print(detailsAboutLector)

//ამ ორი რეფერენსის განილება იწვევს lectorAbashidze-ს ობიექტის გაუქმებას

//lectorAbashidze = nil
//courseOfUIUX?.lector = nil

//courseOfUIUX-ს რეფერენსის განილება აუქმებს ობიექტს სადაც weak reference-ით უკავშირდება lectorAbashidze.course,ანუ ნილდება ეს ფროფერთიც.
courseOfUIUX = nil
lectorAbashidze
