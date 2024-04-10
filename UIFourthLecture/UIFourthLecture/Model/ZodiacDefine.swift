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
    let poralZodiacSign: String
    let signImage: UIImageView
}
let aries = Zodiac(name: "ვერძი",
                   description:
                    "დღევანდელი დღე თქვენს ცხოვრებაში კიდევ ერთი წარმატებული დღე იქნება. საქმეში სასურველ შედეგს ადვილად მიაღწევთ. სიყვარულში თქვენს გულს მიენდეთ.",
                   poralZodiacSign: "სასწორი",
                   signImage: UIImageView(image: .iconaries))
let taurus = Zodiac(name: "კურო",
                    description: "თუ თქვენ ჯერ კიდევ არ დაგიმსახურებიათ ფინანსებში გენიოსის რეპუტაცია, ეს მხოლოდ უბრალო შემთხვევითობის ბრალია.",
                    poralZodiacSign: "მორიელი",
                    signImage: UIImageView(image: .icontaurus))
let gemini = Zodiac(name: "ტყუპები",
                    description: "ახალი საქმეების წამოსაწყებად იდეალური პერიოდია. დასახეთ სამომავლო გეგმები. კარგი იქნება, თუ პროფილაქტიკურ მკურნალობას ჩაიტარებთ.",
                    poralZodiacSign: "მშვილდოსანი",
                    signImage: UIImageView(image: .icongemini))
let cancer = Zodiac(name: "კირჩხიბი",
                    description: "აკონტროლეთ ყველაფერი, განსაკუთრებით ფინანსური ოპერაციები. დღეს მრავალი იდეა მოგივათ თავში.",
                    poralZodiacSign: "თხის რქა",
                    signImage: UIImageView(image: .iconcancer))
let leo = Zodiac(name: "ლომი",
                 description: "დღე განსაკუთრებით ხელსაყრელია შემოქმედებითი საქმიანობით დაკავებული ადამიანებისათვის. თქვენ შეიძლება მიაღწიოთ შემოქმედებით წარმატებებს. აუცილებელია მარილიანი, ცხიმიანი და მწარე საკვების შეზღუდვა. დღის პირველ ნახევარში მოსალოდნელია გეგმების შეცვლა.",
                 poralZodiacSign: "მერწყლი",
                 signImage: UIImageView(image: .iconleo))
let virgo = Zodiac(name: "ქალწული",
                   description: "დღეს თქვენ წაგლეკავთ უაზრო ემოციები. აიყვანეთ თქვენი თავი ხელში.",
                   poralZodiacSign: "თევზები",
                   signImage: UIImageView(image: .iconvirgo))
let libra = Zodiac(name: "სასწორი",
                   description: "დღეს, გელით სერიოზული სამუშაო და თამამი ჩანაფიქრების ასრულება.",
                   poralZodiacSign: "ვერძი",
                   signImage:  UIImageView(image: .iconlibra))
let scorpio = Zodiac(name: "მორიელი",
                     description: "დღეს ტყუილი არ გიშველით, ამით თქვენ უფრო მეტ ზიანს მიაყენებთ საკუთარ თავს.",
                     poralZodiacSign: "კურო",
                     signImage: UIImageView(image: .iconscorpio))
let sagittarius = Zodiac(name: "მშვილდოსანი",
                         description: "მიუხედავად დაკავებულობისა, ამ დღეს მხიარლად გაატარებთ. მეგობრების გარემოცვაში გაატარებთ დღევანდელ საღამოს.",
                         poralZodiacSign: "ტყუპები",
                         signImage: UIImageView(image: .iconsagittarius))
let capricorn = Zodiac(name: "თხის რქა",
                       description: "პატარ-პატარა პრობლემებს გულთან ახლოს ნუ მიიტანთ, რადგან შესაძლოა დეპრესია მოგეძალოთ. ეცადეთ, დროის მნიშვნელოვანი ნაწილი სასიამოვნო გარემოში გაატაროთ.",
                       poralZodiacSign: "კირჩხიბი",
                       signImage: UIImageView(image: .iconcapricorn))
let aquarius = Zodiac(name: "მერწყული",
                      description: "თქვენს ცხოვრებაში წარმატებული პერიოდი დადგა. ეცადეთ, მაქსიმალურად იაქტიუროთ, რათა ცხოვრება უკეთესობისაკენ შეცვალოთ. დღეს თავს ყველგან ისე იგრძნობთ, როგორც საკუთარ სახლში.",
                      poralZodiacSign: "ლომი",
                      signImage: UIImageView(image: .iconaquarius))
let pisces = Zodiac(name: "თევზები",
                    description: "დღე ხელსაყრელია საქმეების წამოწყებისათვის. დღეს ნუ წაიყვანთ შინაურ ცხოველებს ვეტერინართან, შეძლებისდაგვარად გადადეთ ეს ღონისძიება რამდენიმე დღით. ახალი კავშირები საქმიან პარტნიორებთან შეიძლება აღმოჩნდეს ძალზე მყარი. საღამოს უმჯობესია ივარჯიშოთ სპორტულ დარბაზში.",
                    poralZodiacSign: "ქალწული",
                    signImage: UIImageView(image: .iconpisces))
