//
//  MainPageVC + ExtGalleryCollectionView.swift
//  PhotosApp
//
//  Created by Temur Chitashvili on 08.05.24.
//

import UIKit

//MARK: Extensions For MainPageVC UICollection
extension MainPageVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullScreenVC = FullScreenVC(fullScreenView: FullScreenView(), fullScreenViewModel: FullScreenViewModel())
        navigationController?.pushViewController(fullScreenVC, animated: false)
    }
}

extension MainPageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 118, height: 136.96)
    }
}

//MARK: Extension Of SnapShotDelegate
extension MainPageVC: SnapshotDelegate {
    enum Section {
        case main
    }
    
    func applySnapshot(with imageModel: [ImageModel]) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(imageModel)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    //MARK: Configure CollectinView Data Source
    func configureCollectionViewDataSource() {
        dataSource = DataSource(collectionView: mainPageView.galleryCollectionView, cellProvider: { (collectionView, indexPath, imageUrl) -> ImageCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell
            cell?.configure(imageUrl: imageUrl.urls.regular)
            return cell
        })
    }
}

