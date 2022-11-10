//
//  UIView+Extensions.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 10/11/22.
//

import Foundation
import UIKit

extension UIView {
    func applyCorners(for containerView: UIView) {

        containerView.layer.cornerRadius = 4
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    }

}
