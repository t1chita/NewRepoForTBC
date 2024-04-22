//
//  CountryDetailsPageVC + ExtUITableView.swift
//  CountryInfoApp
//
//  Created by Temur Chitashvili on 21.04.24.
//

//import UIKit
//
//extension CountryDetailsPageVC: UITableViewDelegate {
//}
//
//extension CountryDetailsPageVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        15
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        generalLabelsTexts.count
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerInSectionView = UIView()
//        headerInSectionView.backgroundColor = .clear
//        return headerInSectionView
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = basicInformationTableView.dequeueReusableCell(withIdentifier: BasicInformationCell.identifier, for: indexPath) as? BasicInformationCell
//        cell?.configure(generalLabel: generalLabelsTexts[indexPath.section], countriesLabel: countriesArrayForDetails[indexPath.section].name?.common )
//        return cell ?? UITableViewCell()
//    }
//}
