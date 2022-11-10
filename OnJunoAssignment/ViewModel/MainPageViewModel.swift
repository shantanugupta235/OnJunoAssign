//
//  MainPageViewModel.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 08/11/22.
//

import Foundation
protocol ImageLoadedDelegate: AnyObject {
    func didGetLogoImage(data: Data)
}

class MainPageViewModel {
    let urlForState0 = "https://demo9414936.mockable.io/empty-home"
    let urlForState1 = "https://demo9414936.mockable.io/home"
    var apiUrl:String=""
    var realImgData: Data?
    
    weak var delegate: ImageLoadedDelegate?
    
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
    func performImageLoaderRequest(url: String) {
        
        ImageLoader.getImageFromUrl(url: url, completion: { [weak self] data in
            
            self?.realImgData = data
            if let realImgData = self?.realImgData{
                self?.delegate?.didGetLogoImage(data: realImgData)
            }
            
        })

    }
}
