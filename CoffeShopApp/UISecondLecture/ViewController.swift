//
//  ViewController.swift
//  UISecondLecture
//
//  Created by Temur Chitashvili on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coffeImage: UIImageView!
    
    @IBOutlet weak var nameAndIngredientStack: UIStackView!
    @IBOutlet weak var coffeNameLabel: UILabel!
    @IBOutlet weak var coffeIngredientLabel: UILabel!
    
    
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var coffeRatingLabel: UILabel!
    @IBOutlet weak var peopleWhoRated: UILabel!
    @IBOutlet weak var favoriteHeartButton: UIButton!
    @IBOutlet weak var favoriteHeartFilledButton: UIButton!
    
    @IBOutlet weak var descriptionHeadLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var sizeOfCupLabel: UILabel!
    
    
    
    @IBOutlet weak var sizeLittleButton: UIButton!
    @IBOutlet weak var sizeMediumButton: UIButton!
    @IBOutlet weak var sizeLargeButton: UIButton!
    
    @IBOutlet weak var priceVStack: UIStackView!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceHstack: UIStackView!
    @IBOutlet weak var gelSymbol: UILabel!
    @IBOutlet weak var priceInIntLabel: UILabel!
    
    @IBOutlet weak var buttonToBuyCoffe: UIButton!
    
    
    var peopleWhoLikedProduct: Int = 230
    let arrayOfCappuccinoMl = [150 , 200 , 300]
    let arrayOfHowMuchEspressoIsInCappuccino = [25, 35, 45]
    let arrayOfHowMuchMilkisInCappuccino = [85, 95, 105]
    
    var cappuccinoMl = 0
    var espressoInCappuccino = 0
    var milkInCappuccino = 0
    let coffeCappucino = Coffee(productName: "კაპუჩინო", specialIngredient: "შოკოლადით", rating: 4.8)
    
    @IBAction func actionFavorite(_ sender: UIButton) {
        favoriteHeartFilledButton.isHidden = false
        favoriteHeartButton.isHidden = true
        peopleWhoLikedProduct += 1
        peopleWhoRated.text = "(\(String(peopleWhoLikedProduct)))"
    }
    
    @IBAction func actionUnfavorite(_ sender: UIButton) {
        favoriteHeartFilledButton.isHidden = true
        favoriteHeartButton.isHidden = false
        peopleWhoLikedProduct -= 1
        peopleWhoRated.text = "(\(String(peopleWhoLikedProduct)))"
    }
    @IBAction func changeSizeAndDescriptionOnLittleCoffe(_ sender: UIButton) {
        sizeLittleButton.tintColor = UIColor.price
        sizeLittleButton.backgroundColor = UIColor.sizeButtonBackground
        sizeLittleButton.layer.borderColor = UIColor.price.cgColor
        sizeLittleButton.layer.borderWidth = 3
        
        sizeLargeButton.layer.borderColor = UIColor.buttonBorder.cgColor
        sizeLargeButton.tintColor = UIColor.coffeName
        sizeLargeButton.backgroundColor = UIColor.white
        
        sizeMediumButton.layer.borderColor = UIColor.buttonBorder.cgColor
        sizeMediumButton.tintColor = UIColor.coffeName
        sizeMediumButton.backgroundColor = UIColor.white
        priceInIntLabel.text = String(coffeCappucino.dictionaryForSizeAndPrice["პაწა"] ?? 0)
        
        cappuccinoMl = arrayOfCappuccinoMl[0]
        espressoInCappuccino = arrayOfHowMuchEspressoIsInCappuccino[0]
        milkInCappuccino = arrayOfHowMuchMilkisInCappuccino[0]
        coffeCappucino.description =  "მოცემული კაპუჩინო არის დაახლოებით \(cappuccinoMl) მლ. ის შეიცავს \(espressoInCappuccino) მლ. ესპრესოს ყავას, \(milkInCappuccino) მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."
        descriptionLabel.text = coffeCappucino.description
        
    }
    
    @IBAction func changeSizeAndDescriptionOnMediumCoffe(_ sender: UIButton) {
        sizeMediumButton.tintColor = UIColor.price
        sizeMediumButton.backgroundColor = UIColor.sizeButtonBackground
        sizeMediumButton.layer.borderWidth = 3
        sizeMediumButton.layer.borderColor = UIColor.price.cgColor
        
        sizeLittleButton.tintColor = UIColor.coffeName
        sizeLittleButton.backgroundColor = UIColor.white
        sizeLittleButton.layer.borderColor = UIColor.buttonBorder.cgColor
        
        sizeLargeButton.tintColor = UIColor.coffeName
        sizeLargeButton.backgroundColor = UIColor.white
        sizeLargeButton.layer.borderColor = UIColor.buttonBorder.cgColor
        priceInIntLabel.text = String(coffeCappucino.dictionaryForSizeAndPrice["საშუალო"] ?? 0)
        cappuccinoMl = arrayOfCappuccinoMl[1]
        espressoInCappuccino = arrayOfHowMuchEspressoIsInCappuccino[1]
        milkInCappuccino = arrayOfHowMuchMilkisInCappuccino[1]
        coffeCappucino.description =  "მოცემული კაპუჩინო არის დაახლოებით \(cappuccinoMl) მლ. ის შეიცავს \(espressoInCappuccino) მლ. ესპრესოს ყავას, \(milkInCappuccino) მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."
        descriptionLabel.text = coffeCappucino.description
        
        
    }
    
    @IBAction func changeSizeAndDescriptionOnLargeCoffe(_ sender: UIButton) {
        sizeLargeButton.tintColor = UIColor.price
        sizeLargeButton.backgroundColor = UIColor.sizeButtonBackground
        sizeLargeButton.layer.borderWidth = 3
        sizeLargeButton.layer.borderColor = UIColor.price.cgColor
        
        sizeLittleButton.tintColor = UIColor.coffeName
        sizeLittleButton.backgroundColor = UIColor.white
        sizeLittleButton.layer.borderColor = UIColor.buttonBorder.cgColor
        
        sizeMediumButton.tintColor = UIColor.coffeName
        sizeMediumButton.backgroundColor = UIColor.white
        sizeMediumButton.layer.borderColor = UIColor.buttonBorder.cgColor
        
        priceInIntLabel.text = String(coffeCappucino.dictionaryForSizeAndPrice["დიდი"] ?? 0)
        
        cappuccinoMl = arrayOfCappuccinoMl[2]
        espressoInCappuccino = arrayOfHowMuchEspressoIsInCappuccino[2]
        milkInCappuccino = arrayOfHowMuchMilkisInCappuccino[2]
        coffeCappucino.description =  "მოცემული კაპუჩინო არის დაახლოებით \(cappuccinoMl) მლ. ის შეიცავს \(espressoInCappuccino) მლ. ესპრესოს ყავას, \(milkInCappuccino) მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."
        descriptionLabel.text = coffeCappucino.description
    }
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cappuccinoMl = arrayOfCappuccinoMl[0]
        espressoInCappuccino = arrayOfHowMuchEspressoIsInCappuccino[0]
        milkInCappuccino = arrayOfHowMuchMilkisInCappuccino[0]
        
        coffeCappucino.description = "მოცემული კაპუჩინო არის დაახლოებით \(cappuccinoMl) მლ. ის შეიცავს \(espressoInCappuccino) მლ. ესპრესოს ყავას, \(milkInCappuccino) მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."
    
        
        coffeImage.layer.cornerRadius = 16
        coffeImage.clipsToBounds = true
        
        coffeNameLabel.text = coffeCappucino.productName
        coffeNameLabel.textColor = UIColor.coffeName
        coffeNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        nameAndIngredientStack.setCustomSpacing(8, after: coffeNameLabel)
        
        coffeIngredientLabel.text = coffeCappucino.specialIngredient
        coffeIngredientLabel.textColor = UIColor.coffeIngredient
        coffeIngredientLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        view.addSubview(ratingView)
        let ratingInString = String(coffeCappucino.rating ?? 0)
        coffeRatingLabel.text = ratingInString
        coffeRatingLabel.textColor = UIColor.coffeName
        coffeRatingLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        peopleWhoRated.text = "(\(String(peopleWhoLikedProduct)))"
        peopleWhoRated.textColor = UIColor.peopleWhoRated
        peopleWhoRated.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        favoriteHeartFilledButton.isHidden = true
        
        descriptionHeadLabel.text = "აღწერა"
        descriptionHeadLabel.textColor = UIColor.coffeName
        descriptionHeadLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        descriptionLabel.text = coffeCappucino.description
        descriptionLabel.textColor = UIColor.coffeIngredient
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    
        
        sizeOfCupLabel.text = "ზომა"
    
        sizeLittleButton.setTitle("პაწა", for: .normal)
        sizeLittleButton.layer.borderWidth = 3
        sizeLittleButton.layer.borderColor = UIColor.price.cgColor
        sizeLittleButton.layer.cornerRadius = 12
        sizeLittleButton.clipsToBounds = true
        sizeLittleButton.tintColor = UIColor.price
        sizeLittleButton.backgroundColor = UIColor.sizeButtonBackground
        
        
        sizeMediumButton.setTitle("საშუალო", for: .normal)
        sizeMediumButton.layer.borderWidth = 3
        sizeMediumButton.layer.borderColor = UIColor.buttonBorder.cgColor
        sizeMediumButton.layer.cornerRadius = 12
        sizeMediumButton.clipsToBounds = true
        sizeMediumButton.tintColor = UIColor.coffeName
        
        sizeLargeButton.setTitle("დიდი", for: .normal)
        sizeLargeButton.layer.borderWidth = 3
        sizeLargeButton.layer.borderColor = UIColor.buttonBorder.cgColor
        sizeLargeButton.layer.cornerRadius = 12
        sizeLargeButton.clipsToBounds = true
        sizeLargeButton.tintColor = UIColor.coffeName
        
        
        priceLabel.text = "ფასი"
        priceLabel.textColor = UIColor.coffeIngredient
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        gelSymbol.text = "₾"
        gelSymbol.textColor = UIColor.price
        gelSymbol.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        
        priceInIntLabel.text = String(coffeCappucino.dictionaryForSizeAndPrice["პაწა"] ?? 0)
        priceInIntLabel.textColor = UIColor.price
        priceInIntLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
     
        buttonToBuyCoffe.backgroundColor = UIColor.price
        buttonToBuyCoffe.tintColor = UIColor.white
        buttonToBuyCoffe.setTitle("ყიდვა", for: .normal)
        buttonToBuyCoffe.layer.cornerRadius = 16
        buttonToBuyCoffe.clipsToBounds = true
    }
    
    
}



