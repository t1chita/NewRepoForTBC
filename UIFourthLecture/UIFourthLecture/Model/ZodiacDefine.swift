//
//  ZodiacDefine.swift
//  UIFourthLecture
//
//  Created by Temur Chitashvili on 10.04.24.
//

import UIKit

struct Zodiac {
    let name: String
    let description: String
    let poralZodiacName: String
    let poralZodiacSignImage: UIImageView
    let signImage: UIImageView
}
let aries = Zodiac(name: "ვერძი",
                   description:
                    "დღევანდელი დღე თქვენს ცხოვრებაში კიდევ ერთი წარმატებული დღე იქნება. საქმეში სასურველ შედეგს ადვილად მიაღწევთ. სიყვარულში თქვენს გულს მიენდეთ.",
                   poralZodiacName: "სასწორი", poralZodiacSignImage: UIImageView(image: .iconlibra),
                   signImage: UIImageView(image: .iconaries))
let taurus = Zodiac(name: "კურო",
                    description: "თუ თქვენ ჯერ კიდევ არ დაგიმსახურებიათ ფინანსებში გენიოსის რეპუტაცია, ეს მხოლოდ უბრალო შემთხვევითობის ბრალია.",
                    poralZodiacName: "მორიელი", poralZodiacSignImage: UIImageView(image: .iconscorpio),
                    signImage: UIImageView(image: .icontaurus))
let gemini = Zodiac(name: "ტყუპები",
                    description: "ახალი საქმეების წამოსაწყებად იდეალური პერიოდია. დასახეთ სამომავლო გეგმები. კარგი იქნება, თუ პროფილაქტიკურ მკურნალობას ჩაიტარებთ.",
                    poralZodiacName: "მშვილდოსანი", poralZodiacSignImage: UIImageView(image: .iconsagittarius),
                    signImage: UIImageView(image: .icongemini))
let cancer = Zodiac(name: "კირჩხიბი",
                    description: "აკონტროლეთ ყველაფერი, განსაკუთრებით ფინანსური ოპერაციები. დღეს მრავალი იდეა მოგივათ თავში.",
                    poralZodiacName: "თხის რქა", poralZodiacSignImage: UIImageView(image: .iconcapricorn),
                    signImage: UIImageView(image: .iconcancer))
let leo = Zodiac(name: "ლომი",
                 description: "დღე განსაკუთრებით ხელსაყრელია შემოქმედებითი საქმიანობით დაკავებული ადამიანებისათვის. თქვენ შეიძლება მიაღწიოთ შემოქმედებით წარმატებებს. აუცილებელია მარილიანი, ცხიმიანი და მწარე საკვების შეზღუდვა. დღის პირველ ნახევარში მოსალოდნელია გეგმების შეცვლა.",
                 poralZodiacName: "მერწყული", poralZodiacSignImage: UIImageView(image: .iconaquarius),
                 signImage: UIImageView(image: .iconleo))
let virgo = Zodiac(name: "ქალწული",
                   description: "დღეს თქვენ წაგლეკავთ უაზრო ემოციები. აიყვანეთ თქვენი თავი ხელში.",
                   poralZodiacName: "თევზები", poralZodiacSignImage: UIImageView(image: .iconpisces),
                   signImage: UIImageView(image: .iconvirgo))
let libra = Zodiac(name: "სასწორი",
                   description: "დღეს, გელით სერიოზული სამუშაო და თამამი ჩანაფიქრების ასრულება.",
                   poralZodiacName: "ვერძი", poralZodiacSignImage: UIImageView(image: .iconaries),
                   signImage:  UIImageView(image: .iconlibra))
let scorpio = Zodiac(name: "მორიელი",
                     description: "დღეს ტყუილი არ გიშველით, ამით თქვენ უფრო მეტ ზიანს მიაყენებთ საკუთარ თავს.",
                     poralZodiacName: "კურო", poralZodiacSignImage: UIImageView(image: .icontaurus),
                     signImage: UIImageView(image: .iconscorpio))
let sagittarius = Zodiac(name: "მშვილდოსანი",
                         description: "მიუხედავად დაკავებულობისა, ამ დღეს მხიარლად გაატარებთ. მეგობრების გარემოცვაში გაატარებთ დღევანდელ საღამოს.",
                         poralZodiacName: "ტყუპები", poralZodiacSignImage: UIImageView(image: .icongemini),
                         signImage: UIImageView(image: .iconsagittarius))
let capricorn = Zodiac(name: "თხის რქა",
                       description: "პატარ-პატარა პრობლემებს გულთან ახლოს ნუ მიიტანთ, რადგან შესაძლოა დეპრესია მოგეძალოთ. ეცადეთ, დროის მნიშვნელოვანი ნაწილი სასიამოვნო გარემოში გაატაროთ.",
                       poralZodiacName: "კირჩხიბი", poralZodiacSignImage: UIImageView(image: .iconcancer),
                       signImage: UIImageView(image: .iconcapricorn))
let aquarius = Zodiac(name: "მერწყული",
                      description: "თქვენს ცხოვრებაში წარმატებული პერიოდი დადგა. ეცადეთ, მაქსიმალურად იაქტიუროთ, რათა ცხოვრება უკეთესობისაკენ შეცვალოთ. დღეს თავს ყველგან ისე იგრძნობთ, როგორც საკუთარ სახლში.",
                      poralZodiacName: "ლომი", poralZodiacSignImage: UIImageView(image: .iconleo),
                      signImage: UIImageView(image: .iconaquarius))
let pisces = Zodiac(name: "თევზები",
                    description: "დღე ხელსაყრელია საქმეების წამოწყებისათვის. დღეს ნუ წაიყვანთ შინაურ ცხოველებს ვეტერინართან, შეძლებისდაგვარად გადადეთ ეს ღონისძიება რამდენიმე დღით. ახალი კავშირები საქმიან პარტნიორებთან შეიძლება აღმოჩნდეს ძალზე მყარი. საღამოს უმჯობესია ივარჯიშოთ სპორტულ დარბაზში.",
                    poralZodiacName: "ქალწული", poralZodiacSignImage: UIImageView(image: .iconvirgo),
                    signImage: UIImageView(image: .iconpisces))
