//
//  ImageLoader.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 09/11/22.
//

import Foundation
import UIKit

class ImageLoader{
    class func getImageFromUrl(url: String, completion: @escaping (Data)->()){
        if let urlString = URL(string: url){
            let task = URLSession.shared.dataTask(with: urlString, completionHandler: {(data,_,_) in
                if let data = data{
                    
                    completion(data)
                }
            })
            task.resume()
        }
    }
}
