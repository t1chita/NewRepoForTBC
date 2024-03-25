import Foundation

class Book {
    var bookID: Int
    var title: String
    var author: String
    var isBorrowed: Bool
    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }
    func bookStatus () {
        isBorrowed = true
    }
}
var newBook = Book(bookID: 100, title: "სალომეს დღიურები", author: "სალომე თოფურია", isBorrowed: false)
 
newBook.bookStatus()
