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
class MainPageViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var state : States?
    var homeContentModel: HomeModel?
    
    let mainPageViewModel = MainPageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(MainPageTableViewCell.nib(), forCellReuseIdentifier: MainPageTableViewCell.identifier)
        tableView.register(UINib(nibName: "HeaderMainPageTVCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderMainPageTVCell")
        tableView.register(CollectionInTableViewCell.nib(), forCellReuseIdentifier: CollectionInTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let state = state else{
           return
        }
        //print(state.rawValue)
        mainPageViewModel.performRequest(for: state, completion: { [weak self] homeModel in
            guard let weakSelf = self else { return }
            weakSelf.homeContentModel = homeModel
            
            DispatchQueue.main.async {
                weakSelf.tableView.reloadData()
            }
        })
        
    }

}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return homeContentModel?.your_crypto_holdings.count ?? 0
        case 2:
            return homeContentModel?.all_transactions.count ?? 0
        case 3:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: CollectionInTableViewCell.identifier, for: indexPath) as! CollectionInTableViewCell
            if let homeContentModel = homeContentModel{
                cell.configure(with: homeContentModel.crypto_prices)
            }
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: MainPageTableViewCell.identifier, for: indexPath) as! MainPageTableViewCell
            
            if let homeContentModel = homeContentModel{
                cell.configureCell(homeData: homeContentModel, row: indexPath.row, section: indexPath.section, state: state!, viewModel: mainPageViewModel)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3{
            return CGFloat(200)
        }
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderMainPageTVCell") as! HeaderMainPageTVCell
        headerView.configureHeaderForSection(section: section)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else{
            return 60
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
