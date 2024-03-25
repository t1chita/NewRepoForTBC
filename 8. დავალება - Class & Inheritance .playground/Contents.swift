import Foundation

//🎯1.შევქმნათ Class Book.

class Book: Equatable {
    //-----Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.✅
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool
    
    //-----Designated Init.✅
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    //-----Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.✅
    func bookIsBorrowed() {
        isBorrowed = true
    }
    //-----Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.✅
    func bookIsReturned()  {
        isBorrowed = false
    }
    
    
}
extension Book {
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.author == rhs.author && lhs.isBorrowed == rhs.isBorrowed &&
        lhs.bookID == rhs.bookID && lhs.title == rhs.title
    }
}

//🎯2.შევქმნათ Class Owner


class Owner {
    //-----Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.✅
    let ownerID: Int
    let name: String
    var borrowedBooks: [Book] = []
    
    //-----Designated Init.✅
    init(ownerID: Int, name: String) {
        self.ownerID = ownerID
        self.name = name
    }
    //-----Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.✅
    func takeBookFromLibrary(book: Book){
            print("You took the book from library")
            borrowedBooks.append(book)
            book.bookIsBorrowed()
    }
    //-----Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.✅
    func returnBookInTheLibrary(book: Book){
        if book.isBorrowed == true{
            if let index = borrowedBooks.firstIndex(of: book){
                print("You returned book in library")
                borrowedBooks.remove(at: index)
                book.bookIsReturned()
            }else{
                print("You don't have this book")
            }
        }
    }
}


//🎯3.შევქმნათ Class Library


class Library{
    //-----Properties: Books Array, Owners Array.✅
    var BooksArray: [Book] = []
    var OwnersArray: [Owner] = []
//    
    //-----Designated Init.✅
   
    //-----Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.✅
    func addBooksInLibrary(book:Book) {
        BooksArray.append(book)
    }
    //-----Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.✅
    func addOwnersInLibrary(owner:Owner) {
        OwnersArray.append(owner)
    }
    //-----Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.✅
    func findReturnedBooks(bookArray: [Book]) -> [Book] {
        var returnedBooksArray: [Book] = []
        for book in bookArray{
            if book.isBorrowed == false{
                returnedBooksArray.append(book)
            }
        }
        return returnedBooksArray
    }
    //-----Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.✅
    func findBorrowedBooks(bookArray: [Book]) -> [Book]{
        var borrowedBooksArray: [Book] = []
        for book in bookArray{
            if book.isBorrowed == true{
                borrowedBooksArray.append(book)
            }
        }
        return borrowedBooksArray
    }
    
    //-----Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.✅
    func searchOwnerWithOwnerID(ownerArray: [Owner], ownerID: Int) {
        for owner in ownerArray{
            if owner.ownerID == ownerID{
                print("We found owner with \(owner.ownerID),he/she is \(owner)")
            }else{
                print("We can't find owner with \(owner.ownerID)")
            }
        }
        
    }
    //-----Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.✅
    func searchBorrowedBooksByUniqueOwner(owner: Owner, booksArray: [Book]) -> [Book]{
        var borrowedBooksByUniqueOwner: [Book] = []
        for book in booksArray{
            for bookFromOwnersArray in owner.borrowedBooks{
                if book.isBorrowed == true && book == bookFromOwnersArray{
                    borrowedBooksByUniqueOwner.append(book)
                }
            }
        }
        return borrowedBooksByUniqueOwner
    }
    //-----Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.✅
    func takeBookIfIsReturned(owner: Owner, booksArray: [Book]){
        for book in booksArray{
            if book.isBorrowed == false {
                owner.takeBookFromLibrary(book: book)
            }else{
                print("You can't take book.")
            }
        }
    }
}


//🎯4.გავაკეთოთ ბიბლიოთეკის სიმულაცია.
//
//-----შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.✅
var bookTetriLomi = Book(bookID: 1, title: "თეთრი ლომი", author: "თემურ ჩიტაშვილი", isBorrowed: false)
var bookLurjiPantera = Book(bookID: 2, title: "ლურჯი პანტერა", author: "ოთარ რამიშვილი", isBorrowed: false)
var bookMwvaneSpilo = Book(bookID: 3, title: "მწვანე სპილო", author: "ანა ტყებუჩავა", isBorrowed: false)
var ownerSandro = Owner(ownerID: 1, name: "სანდრო")
var ownerGigi = Owner(ownerID: 2, name: "გიგი")
var ownerLuka = Owner(ownerID: 3, name: "ლუკა")


var mainLibrary = Library()

//-----დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში✅

//დავამატოთ წიგნები✅
mainLibrary.addBooksInLibrary(book: bookTetriLomi)
mainLibrary.addBooksInLibrary(book: bookLurjiPantera)
mainLibrary.addBooksInLibrary(book: bookMwvaneSpilo)
//დავამატოთ owner-ები✅
mainLibrary.addOwnersInLibrary(owner: ownerGigi)
mainLibrary.addOwnersInLibrary(owner: ownerLuka)
mainLibrary.addOwnersInLibrary(owner: ownerSandro)
//-----წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.✅
ownerGigi.takeBookFromLibrary(book: bookTetriLomi)
ownerGigi.takeBookFromLibrary(book: bookMwvaneSpilo)
ownerGigi.takeBookFromLibrary(book: bookLurjiPantera)

ownerGigi.returnBookInTheLibrary(book: bookTetriLomi)
ownerGigi.returnBookInTheLibrary(book: bookMwvaneSpilo)

//-----დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.✅
mainLibrary.findBorrowedBooks(bookArray: mainLibrary.BooksArray)
mainLibrary.findReturnedBooks(bookArray: mainLibrary.BooksArray)

mainLibrary.searchBorrowedBooksByUniqueOwner(owner: ownerGigi, booksArray: mainLibrary.BooksArray)


//შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია.
//შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს
//ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:

class AdgeGenerator{
    var killerAdges: [String] = [
        "დავინახე თუ არა მივხვდი, რომ – ” დევიღუპე. ”",
        "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად",
        "სულის ტკივილამდე ვტკივილობ….",
       "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
        "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ",
        "ფულის წვიმა რომ მოდიოდეს ნისიების რვეული დამეცემა თავზე",
        "თქვენ მოჰკალით ძერა?",
        "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...",
        "მზე აღარ ამოდის ჩაგვიჭრეს"
    ]
    func randomJoke() -> String {
        var unwrappedRandomJoke: String = ""
        if let randomJoke = killerAdges.randomElement(){
            unwrappedRandomJoke = randomJoke
        }
        print(unwrappedRandomJoke)
        return unwrappedRandomJoke
    }
    func addOrRemoveAdgesFromArray(addAdge: String?, removeAdge: String?) {
        var unwrappedAddAdge: String = ""
        var unwrappedRemoveAdge: String = ""
        if let unwrapAddAdge = addAdge{
            unwrappedAddAdge = unwrapAddAdge
            killerAdges.append(unwrapAddAdge)
        }
        if let unwrapRemoveAdge = removeAdge {
            unwrappedRemoveAdge = unwrapRemoveAdge
        }
        for adge in killerAdges {
            if unwrappedRemoveAdge == adge {
                if let index = killerAdges.firstIndex(of: adge){
                    killerAdges.remove(at: index)
                }
            }
        }
    }
    
}

var newNew = AdgeGenerator()
newNew.addOrRemoveAdgesFromArray(addAdge: nil, removeAdge: "ბებიააა... ბებია... ოლია მათხოვარი მევიდა...")
