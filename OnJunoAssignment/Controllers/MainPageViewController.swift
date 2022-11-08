//
//  MainPageViewController.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import UIKit

enum States: Int{
    case zero = 0
    case normal = 1
}
class MainPageViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var state : States?
    var homeContentModel: HomeModel? = nil
    
    let viewModel = MainPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else{
           return
        }
        //print(state.rawValue)
        viewModel.performRequest(for: state, completion: { [weak self] homeModel in
            guard let weakSelf = self else { return }
            weakSelf.homeContentModel = homeModel
            print("Come Here Successfully To VC\n")
            print("Just checking----\(String(describing: weakSelf.homeContentModel?.crypto_balance.title))")
        })
        
        // Do any additional setup after loading the view.
    }
    

   

}
