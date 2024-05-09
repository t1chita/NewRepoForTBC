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
        fullScreenVC.fullScreenViewModel.setImageIndex(indexPath.row)
        fullScreenVC.configureCollectionViewDataSource()
        fullScreenVC.applySnapshot(with: mainPageViewModel.imagesArray)
        fullScreenVC.loadImage()
        navigationController?.pushViewController(fullScreenVC, animated: false)
    }
}

extension MainPageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = collectionView.frame.width / 3 - 1
        if UIDevice.current.orientation.isLandscape {
            width = collectionView.frame.width / 6 - 1
        }
        return CGSize(width: width, height: width)
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


