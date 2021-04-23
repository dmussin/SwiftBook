//
//  PhotosCollectionViewController.swift
//  UICollectionView-PhotoView
//
//  Created by Daniyar Mussin on 11/04/2021.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    // Массив с изображениями
    let photos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    
    // универсальная переменная sectionInserts
    let itemsPerRow: CGFloat = 2 // 2 объекта на 1 ряд
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ВТОРОЙ СПОСОБ
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 30)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
        

    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "picPhotoSegue" { // Если segue равен
            
            let photoVC = segue.destination as! PhotoViewController // Добираемся до VC в который переходим в отдельной констансте и его тип равен
            let cell = sender as! PhotoCell // Добираемся до ячейки с которой начался переход
            photoVC.image = cell.myImageView.image // фотографию передаем на второй экран / PhotoViewController - свойство которое хранит изображение
            
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    // Указываем identifier и class collection view controller
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    
        // Название фото из массива
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        
        cell.myImageView.image = image
    
    
        return cell
    }
}

// с помощью протокола можно будет конфигурировать ячейки для flow layout: СПОСОБ1
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let paddingWidth = sectionInserts.left * (itemsPerRow + 1) //отступы между объектами
        let availableWidth = collectionView.frame.width - paddingWidth // доступная ширина
        let widthPerItem = availableWidth / itemsPerRow // ширина объекта
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    // Отступы для ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    // Расстояние между линиями
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
