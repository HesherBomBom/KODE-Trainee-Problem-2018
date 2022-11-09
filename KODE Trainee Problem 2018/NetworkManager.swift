//
//  NetworkManager.swift
//  KODE Trainee Problem 2018
//
//  Created by Pavel Zykov on 09.11.2022.
//

import Foundation

class NetworkManager {
    
    var onCompletion: ((Api) -> Void)?
    
    func fetchCurrent() {
        let urlString = "https://stoplight.io/mocks/kode-education/trainee-test/25143926/users"
        performRequest(with: urlString)
    }
    
    fileprivate func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
        request.addValue("Prefer", forHTTPHeaderField: "code=200, example=success")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { print(error!.localizedDescription); return }
            guard let data = data else { print("Empty data"); return }
            
            if let api = self.parseJSON(withData: data) {
                print("Fetch done!")
                self.onCompletion?(api)
            }
        }.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> Api? {
        let decoder = JSONDecoder()
        do {
            let apiData = try decoder.decode(ApiData.self, from: data)
            guard let api = Api(apiData: apiData) else { return nil }
            return api
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
