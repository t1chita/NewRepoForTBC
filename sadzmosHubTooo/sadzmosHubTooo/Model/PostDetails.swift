//
//  PostDetails.swift
//  sadzmosHubTooo
//
//  Created by Temur Chitashvili on 15.04.24.
//

import UIKit

struct Post {
    let icon: UIImageView
    let headerLabel: String
    let descriptionLabel: String
}

var postsArray: [Post] = [
    Post(icon: UIImageView(image: .redIcon), headerLabel: "რატომ დატოვა გვაზომ ქვეყანა?", descriptionLabel: "ციგნებთან დაპირისპირების შემდეგ გაიპარა ქვეყნიდან"),
    Post(icon: UIImageView(image: .purpleIcon), headerLabel: "რატომ დაბრუნდა ჯარში გიგანტიჩა?", descriptionLabel: "მამისმა დასაჯა"),
    Post(icon: UIImageView(image: .greenIcon), headerLabel: "ვინაა საუკეთესო ფლეილისთის მფლობელი ელიტაში?", descriptionLabel: "რა თქმა უნდა, ჩიტა"),
    Post(icon: UIImageView(image: .goldIcon), headerLabel: "რატომ ვერ ატარებს აბაშა მანქანას?", descriptionLabel: "უბრალოდ ტარება არ იცის,სულელია."),
    Post(icon: UIImageView(image: .purpleIcon), headerLabel: "რატომ დაბრუნდა წავიდა თურქეთში სულო?", descriptionLabel: "აკადემიიდან გამოაგდეს"),
    Post(icon: UIImageView(image: .greenIcon), headerLabel: "ყველაზე კარგი მძღოლი ელიტაში", descriptionLabel: "რა თქმა უნდა, ჩიტა"),
    Post(icon: UIImageView(image: .goldIcon), headerLabel: "რატომ ვერ ატარებს აბაშა მანქანას?", descriptionLabel: "უბრალოდ ტარება არ იცის,სულელია.")
]
