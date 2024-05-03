//
//  MainPageVC + ExtCatTableView.swift
//  CatsApp
//
//  Created by Temur Chitashvili on 02.05.24.
//

import UIKit

extension MainPageVC: UITableViewDelegate {
    
}

extension MainPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainPageViewModel.catsArrayCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCell.identifier, for: indexPath) as! CatCell
        cell.configure(fact: mainPageViewModel.catsArray[indexPath.row].fact ?? "არ ალი")
        return cell
    }
}
