//
//  SquadContactsVC.swift
//  ContactsApp
//
//  Created by Temur Chitashvili on 12.04.24.
//
//🚨ქვემოთ ჩაკომენტარებული რამდენიმე ხაზი და ფუნქციები არის optional-ს დავალება.გამოვიდა მაგრამ სანახევროდ და შესწორების თავი აღარ მაქვს,მომიტევეთ ამდენი კომენტარისთვის :დ
import UIKit

class SquadContactsVC: UIViewController {
    //MARK: UI Components-
    var contactsTableView                      = UITableView()
    var personsNames: [[String]]               = []
    var personsFullNamesFirstLetters: [String] = []
    var personsFullInformation: [Person]       = []
    
    
    //MARK: LifeCycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "iOS Squad"
        
        personsNames                 = fetchData()
        personsFullNamesFirstLetters = getFirstLettersData()
//        personsFullInformation       = fetchPersonsData()
        
        configurationContactsTableView()
        configurationTableHeaderView()
    }
    
    
    //MARK: ConfigurationOfViews-
    func configurationTableHeaderView() {
        let tableHeaderView = OwnersTableViewHeader(frame: CGRect(x: 0, y: 0, width: 343, height: 72))
        contactsTableView.tableHeaderView = tableHeaderView
    }
    
   
    func configurationContactsTableView() {
        view.addSubview(contactsTableView)
        setTableViewDelegates()
        setConstraintsToContactsTableView()
        contactsTableView.rowHeight = 44.5
        contactsTableView.register(PersonsCell.self, forCellReuseIdentifier: "PersonsCell")
    }
    
    
    func setTableViewDelegates() {
        contactsTableView.delegate   = self
        contactsTableView.dataSource = self
    }
    
    
    //MARK: setConstraints-
    func setConstraintsToContactsTableView() {
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            contactsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contactsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            contactsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}


//MARK: SquadContactsVC And UITableViewProtocols
extension SquadContactsVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsNames[section].count
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        29
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return personsNames[section].first?.prefix(1).uppercased()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        personsNames.count
    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        personsFullNamesFirstLetters
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailsPageVC = DetailsPageVC()
//        detailsPageVC.personsImage          = personsFullInformation[indexPath.row].image
//        detailsPageVC.usersFullName.text    = personsFullInformation[indexPath.row].FullName
//        detailsPageVC.usersAgeLabel.text    = String(personsFullInformation[indexPath.row].Age)
//        detailsPageVC.usersHobbyLabel.text  = personsFullInformation[indexPath.row].hobby
//        detailsPageVC.usersGenderLabel.text = personsFullInformation[indexPath.row].gender
//        self.navigationController?.pushViewController(detailsPageVC, animated: true)
//        print(indexPath.row)
//    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonsCell") as! PersonsCell
        let personName = personsNames[indexPath.section][indexPath.row]
        cell.set(nameAndLastName: personName)
        return cell
    }
}


//MARK: SquadContactsVC-
extension SquadContactsVC {
    func getFirstLettersData() -> [String] {
        var firstLettersArray: [String] = []
        var index = 0
        for person in persons {
            guard let firstLetter = person.FullName.first else {
                continue
            }
            firstLettersArray.append(String(firstLetter).uppercased())
        }
        firstLettersArray.sort()
        for char in firstLettersArray {
            if index == firstLettersArray.count - 1 {
                break
            }
            if char == firstLettersArray[index + 1] {
                firstLettersArray.remove(at: index)
                continue
            }
            index += 1
        }
        return firstLettersArray
        }
    
    
//    func fetchPersonsData() -> [Person] {
//        var sortedPersonsArray: [Person] = []
//        
//        for person in persons {
//            var personCopy = person
//            let personUppercasedName = person.FullName.firstUppercased
//            let personWithUppercasedFullName = personUppercasedName.uppercaseLastName(string: personUppercasedName)
//            personCopy.FullName = personWithUppercasedFullName
//            sortedPersonsArray.append(personCopy)
//        }
//        let n = sortedPersonsArray.count
//        for _ in 0..<n {
//            for j in 1..<n {
//                if sortedPersonsArray[j-1].FullName  > sortedPersonsArray[j].FullName {
//                    let temp = sortedPersonsArray[j-1]
//                    sortedPersonsArray[j-1] = sortedPersonsArray[j]
//                    sortedPersonsArray[j] = temp
//                }
//            }
//        }
//       
//        return sortedPersonsArray
//    }
    
    
    func fetchData() -> [[String]] {
        var personDictionary: [Character: [String]] = [:]
        
        for person in persons {
            guard let firstLetter = person.FullName.first else {
                continue
            }
            let uppercasedFirstLetter = firstLetter.uppercased()
            if var personsWithSameFirstLetter = personDictionary[uppercasedFirstLetter.first!] {
                personsWithSameFirstLetter.append(person.FullName)
                personDictionary[uppercasedFirstLetter.first!] = personsWithSameFirstLetter
            } else {
                personDictionary[uppercasedFirstLetter.first!] = [person.FullName]
            }
        }
        let sortedKeys = personDictionary.keys.sorted()
        
        var arrayOfPersonsSorted: [[String]] = []
        for key in sortedKeys {
            if let personsWithSameFirstLetter = personDictionary[key] {
                arrayOfPersonsSorted.append(personsWithSameFirstLetter.sorted())
            }
        }
        return arrayOfPersonsSorted
    }
}
