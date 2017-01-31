//
//  API Client.swift
//  NASA_image of day_API practice
//
//  Created by Marie Park on 11/16/16.
//  Copyright © 2016 Marie Park. All rights reserved.
//

import Foundation
import UIKit

class APIClient {
    
    class func getDataFromAPI(completion: @escaping (PlanetInfo) -> ()) {
        
        let urlString = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
        let url = URL(string: urlString)
        guard let unwrappedUrl = url else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: unwrappedUrl) { (data, response, error) in
            
            print("data test")
            guard let unwrappedData = data else { return }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: String]
                
                        var planetInfo = PlanetInfo(dictionary: responseJSON)
                
                        completion(planetInfo)
                        print("data received")
                    
            } catch {
                print ("error")
            }
        }
        dataTask.resume()
    }
    
    class func getImage(at urlString: String, completion: @escaping (Bool, UIImage?) -> ()){
        
        let url = URL(string: urlString)
        guard let unwrappedUrl = url else { return }
        
        let request = URLRequest(url: unwrappedUrl)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            
            guard let image = UIImage(data: unwrappedData) else { completion(false, nil); return }
            
            completion(true, image)
        }
        dataTask.resume()
    }
}






    
