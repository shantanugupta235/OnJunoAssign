//
//  MainPageTableViewCell.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
class MainPageTableViewCell: UITableViewCell, ImageLoadedDelegate {
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var cellSuperView: UIView!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    
    @IBOutlet weak var nameSubtitleLabel: UILabel!
    
    @IBOutlet weak var depositButton: UIButton!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet weak var infoSubtitleLabel: UILabel!
    
    static var identifier = "MainPageTableViewCell"
    let vModel = MainPageViewModel()
    var imageData: Data?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vModel.delegate = self
    }
    class func nib() -> UINib{
        return UINib(nibName: "MainPageTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(homeData: HomeModel, row: Int,section: Int, state: States, viewModel: MainPageViewModel) {
        if state == .zero{
            if section == 0{
                infoTitleLabel.isHidden = true
                infoSubtitleLabel.isHidden = true
                buyButton.isHidden = true
                
                nameTitleLabel.text = homeData.crypto_balance.title
                nameSubtitleLabel.text = homeData.crypto_balance.subtitle
                logoImage.kf.setImage(with: URL(string: homeData.your_crypto_holdings[1].logo), options: [.processor(SVGImgProcessor())])
            }
            else if section == 1{
                infoStackView.isHidden = true
                infoTitleLabel.isHidden = true
                infoSubtitleLabel.isHidden = true
                nameSubtitleLabel.isHidden = true
                nameTitleLabel.text = homeData.your_crypto_holdings[row].title
                logoImage.kf.setImage(with: URL(string: homeData.your_crypto_holdings[row].logo), options: [.processor(SVGImgProcessor())])
            }
        }
        else if state == .normal{
            if section == 0{
                buyButton.isHidden = true
                depositButton.isHidden = true
                nameTitleLabel.text = homeData.crypto_balance.title
                nameSubtitleLabel.text = homeData.crypto_balance.subtitle
                infoTitleLabel.text = "$" + homeData.crypto_balance.current_bal_in_usd
                infoSubtitleLabel.text = ""
                logoImage.kf.setImage(with: URL(string: homeData.your_crypto_holdings[1].logo), options: [.processor(SVGImgProcessor())])
            }
            else if section == 1{
                buyButton.isHidden = true
                depositButton.isHidden = true
                nameTitleLabel.text = homeData.your_crypto_holdings[row].title
                nameSubtitleLabel.text = homeData.your_crypto_holdings[row].current_bal_in_token + " " + homeData.your_crypto_holdings[row].title
                infoTitleLabel.text = "$" + homeData.your_crypto_holdings[row].current_bal_in_usd
                infoSubtitleLabel.text = ""
                logoImage.kf.setImage(with: URL(string: homeData.your_crypto_holdings[row].logo), options: [.processor(SVGImgProcessor())])
            }
            
        }
        if section == 2{
            buyButton.isHidden = true
            depositButton.isHidden = true
            nameTitleLabel.text = homeData.all_transactions[row].title
            nameSubtitleLabel.text = homeData.all_transactions[row].txn_time
            infoTitleLabel.text = "$" + homeData.all_transactions[row].txn_amount
            infoSubtitleLabel.text = homeData.all_transactions[row].txn_sub_amount
            logoImage.kf.setImage(with: URL(string: homeData.all_transactions[row].txn_logo), options: [.processor(SVGImgProcessor())])
        }
        else if section == 3{
            
        }
    }    
    
    
    func didGetLogoImage(data: Data) {
        self.imageData = data
        guard let rImg = imageData else
        {
            print("couldnot load image for -")
            return
            
        }
        DispatchQueue.main.async {
            self.logoImage.image = UIImage(data: rImg)
        }
        
    }
}
