//
//  MainPageViewModel.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import Foundation

class MainPageViewModel {
    let urlForState0 = "https://demo9414936.mockable.io/empty-home"
    let urlForState1 = "https://demo9414936.mockable.io/home"
    var apiUrl:String=""
    func performRequest(for state: States, completion: @escaping (HomeModel)->()) {
        
        switch state {
            case .zero:
                apiUrl = urlForState0
            case .normal:
                apiUrl = urlForState1
        }
        if let url = URL(string: apiUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: {(data, response, error) in
                guard let data = data,error == nil else{
                    return
                }
                //print(String(data: data, encoding: .utf8)!)
                var resultHomeModel: HomeModel?
                do{
                    resultHomeModel = try JSONDecoder().decode(HomeModel.self, from: data)
                }catch{
                    print("failed to convert ----\(error.localizedDescription)")
                }
                
                guard let resultHomeModel = resultHomeModel else
                {
                    print("Error in homeModel")
                    return
                }
                
                completion(resultHomeModel)
            })
            task.resume()
        }
        
    }
}
