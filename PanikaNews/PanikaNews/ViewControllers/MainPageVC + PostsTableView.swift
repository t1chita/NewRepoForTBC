//
//  MainPageVC + PostsTableView.swift
//  PanikaNews
//
//  Created by Temur Chitashvili on 19.04.24.
//

import UIKit

extension MainPageVC: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let postDetailsVC = PostDetailsVC()
            postDetailsVC.postsDescriptionTextView.text = postsArray[indexPath.section].title
            postDetailsVC.postsTime.text = postsArray[indexPath.section].time
            postDetailsVC.postsImage = UIImageView(image: .temporaryBackground)
            navigationController?.pushViewController(postDetailsVC, animated: true)
        }
    
}

extension MainPageVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        15
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        postsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: PostsCell.identifier, for: indexPath) as? PostsCell
        cell?.configure(time: postsArray[indexPath.section].time, header: postsArray[indexPath.section].title)
        cell?.backgroundView = UIImageView(image: .temporaryBackground)
        cell?.clipsToBounds = true
        cell?.layer.cornerRadius = 15
        
        return cell ?? UITableViewCell()
    }
}
