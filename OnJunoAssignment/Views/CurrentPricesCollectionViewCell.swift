//
//  CurrentPricesCollectionViewCell.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import UIKit

class CurrentPricesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var nameSubtitleLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    
    static let identifier = "CurrentPricesCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func nib() -> UINib{
        return UINib(nibName: "CurrentPricesCollectionViewCell", bundle: nil)
    }

    func configureCollectionCell(currentPrices: CryptoPrices){
        logoImage.kf.setImage(with: URL(string: currentPrices.logo), options: [.processor(SVGImgProcessor())])
        nameTitleLabel.text = currentPrices.title
        nameSubtitleLabel.text = "$" + currentPrices.current_price_in_usd
        print("title -- \(currentPrices.title)\n")
        print("logo -- \(currentPrices.logo)\n")
        print("subtitle -- \(currentPrices.current_price_in_usd)\n")
        containerView.layer.cornerRadius = 4
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor//UIColor(red: 0.141, green: 0.188, blue: 0.239, alpha: 1).cgColor
    }
}
