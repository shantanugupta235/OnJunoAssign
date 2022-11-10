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
        applyCorners(for: contentView)
    }
}
