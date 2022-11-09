//
//  HeaderMainPageTVCell.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 09/11/22.
//

import UIKit

class HeaderMainPageTVCell: UITableViewHeaderFooterView {

   
    @IBOutlet weak var leftHeaderLabel: UILabel!
    
    @IBOutlet weak var rightHeaderLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    func configureHeaderForSection(section: Int) {
        if section == 0{
            leftHeaderLabel.text = ""
            rightHeaderLabel.text = ""
        }
        else if section == 1{
            leftHeaderLabel.text = "Your Crypto Holdings"
            rightHeaderLabel.text = ""
        }
        else if section == 2{
            leftHeaderLabel.text = "Recent Transactions"
            rightHeaderLabel.text = "View All"
        }
        else if section == 3{
            leftHeaderLabel.text = "Current Prices"
            rightHeaderLabel.text = ""
        }
    }

}
