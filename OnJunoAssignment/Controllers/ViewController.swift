//
//  ViewController.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stateButtonTapped(_ sender: Any) {
        if let sender = sender as? UIButton{
            let tag = sender.tag
            if( tag == 0){
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController
                if let vc = vc {
                    vc.state = .zero
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
            else if(tag == 1){
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainPageViewController") as? MainPageViewController
                if let vc = vc {
                    vc.state = .normal
                    navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
}

