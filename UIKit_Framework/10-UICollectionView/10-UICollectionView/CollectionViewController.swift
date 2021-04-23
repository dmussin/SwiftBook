//
//  CollectionViewController.swift
//  10-UICollectionView
//
//  Created by Daniyar Mussin on 20.04.2021.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class CollectionViewController: UICollectionViewController {
    
    let imageNameArray = [
    "Track Number 1 - 01 FF8 - Blamb Garden",
    "Track Number 2 - 02 FF8 - Blue Fields",
    "Track Number 3 - 03 FF8 - Find your way",
    "Track Number 4 - 04 FF8 - Julia",
    "Track Number 5 - 05 FF8 - Trust me",
    "Track Number 6 - 06 FF8 - Under her control",
    "Track Number 7 - 07 FF8 - Martial Law"]

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
    
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
    
        return cell
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.collectionView.indexPathsForSelectedItems?.first{
                let detailsVC = segue.destination as! DetailViewController
                detailsVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }

}
