//
//  PersonInfo.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 12.04.24.
//

import UIKit


struct Person {
    let image: UIImageView
    var FullName: String
    let gender: String
    let Age: Int
    let hobby: String
}

var persons: [Person] = [
    Person(image: UIImageView(image: .abasha), FullName: "vano kvakhadze", gender: "Male", Age: 18, hobby: "Soccer, Cooking, Photography"),
    Person(image: UIImageView(image: .ano), FullName: "gvanca gvagvalia", gender: "Female", Age: 19, hobby: "Reading, Traveling, Dancing"),
    Person(image: UIImageView(image: .meraba), FullName: "sandro supatadze", gender: "Male", Age: 20, hobby: "Gaming, Hiking, Painting"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "akaki titberidze", gender: "Male", Age: 21, hobby: "Chess, Fishing, Writing"),
    Person(image: UIImageView(image: .mushvan), FullName: "begi kopaliani", gender: "Male", Age: 22, hobby: "Cooking, Yoga, Playing guitar"),
    Person(image: UIImageView(image: .abasha), FullName: "aleksandre saroiani", gender: "Male", Age: 23, hobby: "Hiking, Reading, Gardening"),
    Person(image: UIImageView(image: .ano), FullName: "raisa badalova", gender: "Female", Age: 24, hobby: "Painting, Cooking, Photography"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "gega tatulishvili", gender: "Male", Age: 25, hobby: "Photography, Traveling, Fishing"),
    Person(image: UIImageView(image: .mushvan), FullName: "luka gujejiani", gender: "Male", Age: 18, hobby: "Traveling, Playing guitar, Writing"),
    Person(image: UIImageView(image: .lile), FullName: "salome topuria", gender: "Male", Age: 19, hobby: "Dancing, Yoga, Reading"),
    Person(image: UIImageView(image: .meraba), FullName: "giorgi michitashvili", gender: "Male", Age: 20, hobby: "Fishing, Cooking, Gardening"),
    Person(image: UIImageView(image: .tamari), FullName: "tamuna kakhidze", gender: "Female", Age: 21, hobby: "Writing, Painting, Traveling"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "archil menabde", gender: "Male", Age: 22, hobby: "Cycling, Hiking, Gaming"),
    Person(image: UIImageView(image: .mushvan), FullName: "bakar kharabadze", gender: "Male", Age: 23, hobby: "Gardening, Cooking, Playing guitar"),
    Person(image: UIImageView(image: .ano), FullName: "ana namgaladze", gender: "Female", Age: 24, hobby: "Yoga, Reading, Traveling"),
    Person(image: UIImageView(image: .abasha), FullName: "sandro gelashvili", gender: "Male", Age: 25, hobby: "Playing guitar, Photography, Fishing"),
    Person(image: UIImageView(image: .meraba), FullName: "nika kakhniashvili", gender: "Male", Age: 18, hobby: "Reading, Gaming, Cooking"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "data robakidze", gender: "Male", Age: 19, hobby: "Cooking, Painting, Writing"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "luka kharatishvili", gender: "Male", Age: 20, hobby: "Hiking, Fishing, Photography"),
    Person(image: UIImageView(image: .tamari), FullName: "nutsa beriashvili", gender: "Female", Age: 21, hobby: "Painting, Cooking, Dancing"),
    Person(image: UIImageView(image: .mushvan), FullName: "zuka papuashvili", gender: "Male", Age: 22, hobby: "Photography, Gardening, Reading"),
    Person(image: UIImageView(image: .meraba), FullName: "valeri mekhakhishvili", gender: "Male", Age: 23, hobby: "Traveling, Gaming, Writing"),
    Person(image: UIImageView(image: .ano), FullName: "mariam sreseli", gender: "Female", Age: 24, hobby: "Dancing, Yoga, Painting"),
    Person(image: UIImageView(image: .barbare), FullName: "barbare tepnadze", gender: "Female", Age: 25, hobby: "Fishing, Reading, Cooking"),
    Person(image: UIImageView(image: .ano), FullName: "nini bardavelidze", gender: "Female", Age: 18, hobby: "Writing, Traveling, Yoga"),
    Person(image: UIImageView(image: .tamari), FullName: "ana ioramashvili", gender: "Female", Age: 19, hobby: "Cycling, Dancing, Hiking"),
    Person(image: UIImageView(image: .meraba), FullName: "tornike elqanashvili", gender: "Male", Age: 20, hobby: "Gardening, Photography, Cooking"),
    Person(image: UIImageView(image: .tamari), FullName: "irina datoshvili", gender: "Female", Age: 21, hobby: "Yoga, Reading, Painting"),
    Person(image: UIImageView(image: .ano), FullName: "elene donadze", gender: "Female", Age: 22, hobby: "Playing guitar, Cooking, Fishing"),
    Person(image: UIImageView(image: .hajiGiorgi), FullName: "nodar gachava", gender: "Male", Age: 23, hobby: "Reading, Writing, Gaming")
]
