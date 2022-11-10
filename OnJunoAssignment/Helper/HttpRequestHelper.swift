//
//  HttpRequestHelper.swift
//  OnJunoAssignment
//
//  Created by Shantanu Gupta on 10/11/22.
//

import Foundation

class HttpRequestHelper{
    class func fetch(from url: String, complete: @escaping (Bool, Data?)->()){
        if let urlString = URL(string: url){
            let task = URLSession.shared.dataTask(with: urlString, completionHandler: {(data, response, error) in
                guard error == nil else{
                    print("Error in request")
                    print(error!)
                    complete(false,nil)
                    return
                }
                guard let data = data else {
                    print("Error: did not receive data")
                    complete(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    print("Error: HTTP request failed")
                    complete(false, nil)
                    return
                }
                complete(true, data)
            })
            task.resume()
        }
    }
}
