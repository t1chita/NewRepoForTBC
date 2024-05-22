//
//  MainPageVC + ExtCollectionView.swift
//  MusicApp
//
//  Created by Temur Chitashvili on 16.05.24.
//

import UIKit


extension MainPageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCell.identifier, for: indexPath) as! MusicCell
        cell.configure(imageUrl: mainPageViewModel.musicInfoArray[indexPath.row].album?.coverBig, artist: mainPageViewModel.musicInfoArray[indexPath.row].artist?.name, songName: mainPageViewModel.musicInfoArray[indexPath.row].album?.title)
        return cell
    }
}
