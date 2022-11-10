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
class MainPageViewController: UIViewController, ViemModelToControllerDelegate{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var state : States?
    var homeContentModel: HomeModel?
    
    let mainPageViewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initViewModel()
        
    }
    
    func initView(){
        tableView.register(MainPageTableViewCell.nib(), forCellReuseIdentifier: MainPageTableViewCell.identifier)
        tableView.register(UINib(nibName: "HeaderMainPageTVCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderMainPageTVCell")
        tableView.register(CollectionInTableViewCell.nib(), forCellReuseIdentifier: CollectionInTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        mainPageViewModel.delegate = self
    }
    
    func initViewModel(){
        guard let state = state else{
           return
        }
        mainPageViewModel.getMainPageModelData(for: state)
//        mainPageViewModel.performRequest(for: state, completion: { [weak self] homeModel in
//            guard let weakSelf = self else { return }
//            weakSelf.homeContentModel = homeModel
//
//            DispatchQueue.main.async {
//                weakSelf.tableView.reloadData()
//            }
//        })
    }
    func reloadTheData(dataModel: HomeModel) {
        self.homeContentModel = dataModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
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
        return CGFloat(70)//UITableView.automaticDimension
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
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section >= 3{
            return nil
        }
        let insets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)

        let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1))
        v.bounds = v.frame.insetBy(dx: 0.0, dy: 10.0)

        v.backgroundColor = .lightGray.withAlphaComponent(0.5)
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
}
