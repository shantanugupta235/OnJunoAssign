//
//  MainPageViewModel.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import Foundation
protocol ViemModelToControllerDelegate: AnyObject {
    func reloadTheData(dataModel: HomeModel)
}

class MainPageViewModel {
    let urlForState0 = "https://demo9414936.mockable.io/empty-home"
    let urlForState1 = "https://demo9414936.mockable.io/home"
    var apiUrl:String=""
    
    weak var delegate: ViemModelToControllerDelegate?
    
    var homeContentModel: HomeModel?
    
    func getMainPageModelData(for state: States){
        switch state {
            case .zero:
                apiUrl = urlForState0
            case .normal:
                apiUrl = urlForState1
        }
        HttpRequestHelper.fetch(from: apiUrl, complete: {(success, data) in
            if success, let data = data {
                do{
                    self.homeContentModel = try JSONDecoder().decode(HomeModel.self, from: data)
                    guard let homeContentModel = self.homeContentModel else{
                        print("homeContentModel is nil")
                        return
                    }
                    self.delegate?.reloadTheData(dataModel: homeContentModel)
                }
                catch{
                    print("Error:- failed to convert data")
                }
            }else{
                print("Error:- Counldnt complete https fetch ")
            }
        })
    }
}
