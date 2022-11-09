//
//  CollectionInTableViewCell.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 10/11/22.
//

import UIKit

class CollectionInTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    static let identifier = "CollectionInTableViewCell"
    
    var pricesModel = [CryptoPrices]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(CurrentPricesCollectionViewCell.nib(), forCellWithReuseIdentifier: CurrentPricesCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    class func nib() -> UINib{
        return UINib(nibName: "CollectionInTableViewCell", bundle: nil)
    }
    
    func configure(with prices:[CryptoPrices]){
        self.pricesModel = prices
        collectionView.reloadData()
    }
    
}
extension CollectionInTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pricesModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrentPricesCollectionViewCell.identifier, for: indexPath) as! CurrentPricesCollectionViewCell
        cell.configureCollectionCell(currentPrices: pricesModel[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 185)
    }
    
    
}
