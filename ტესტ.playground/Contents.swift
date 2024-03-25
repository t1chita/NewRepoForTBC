import Foundation

//შევქმნათ Class Book.
//Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
//Designated Init.
//Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
//Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.
class Book {
    let bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    
    func bookCondition() {
        print("\(bookID)  წიგნის სათაური- \(title) ავტორი -  \(author) მდგომარეობა - \(isBorrowed) - წაღებული" )
        
    }
    func whereIsBook(){
        print("\(bookID)  წიგნის სათაუ რი- \(title) ავტორი -  \(author) მდგომარეობა - \(isBorrowed) - დაბრუნებული" )
       
    }
}
var book1 = Book(bookID: 13, title: "ssss", author: "nino", isBorrowed: true)
var book2 = Book(bookID: 14, title: "ggg", author: "ako", isBorrowed: false)



class Owner {
    let ownerId: Int
    var name: String
    var BorowedBook: [Book]
    
    init(ownerId: Int, name: String, BorowedBook: [Book]) {
        self.ownerId = ownerId
        self.name = name
        self.BorowedBook = BorowedBook
    }
    
    func takeBook() -> [Book]{
        if book1.isBorrowed == true {
            BorowedBook = [book1]
            
        }
        return BorowedBook
    }
        
    
    func bringBook() -> [Book]{
        print("daabrune")
        return BorowedBook
    }
    
}
 
var ss = Owner(ownerId: 12, name: "vano", BorowedBook: [book2])
if book2.isBorrowed == true {
    ss.takeBook()
}else {
    ss.bringBook()
}
