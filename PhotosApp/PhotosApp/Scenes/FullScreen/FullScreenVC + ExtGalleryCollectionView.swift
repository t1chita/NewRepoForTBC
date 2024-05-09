//
//  FullScreenVC + ExtGalleryCollectionView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 09.05.24.
//

import UIKit

//MARK: Extensions For FullScreenVC UICollection
extension FullScreenVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = fullScreenView.frame.width
        let height: CGFloat = fullScreenView.frame.height - 150
        return CGSize(width: width, height: height)
    }
    
    //MARK: Extension Of SnapShotDelegate
    func applySnapshot(with imageModel: [ImageModel]) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(imageModel)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    //MARK: Configure CollectinView Data Source
    func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: fullScreenView.imagesCollectionView, cellProvider: { (collectionView, indexPath, imageModel) -> FullImageCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullImageCell.identifier, for: indexPath) as? FullImageCell
            cell?.configure(imageUrl: imageModel.urls.regular)
            return cell
        })
    }
}
