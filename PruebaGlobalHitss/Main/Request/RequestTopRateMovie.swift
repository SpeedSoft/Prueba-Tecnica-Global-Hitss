//
//  RequestTopRateMovie.swift
//  PruebaGlobalHitss
//
//  Created by Bart on 15/09/21.
//

import Foundation


class APIService :  NSObject {
    
    private let sourcesURL = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=4de2b7fb774fce18b8da4eab0d9441cd&language=en-US&page=1")!
    
    func apiToGetTopRateMovie(completion : @escaping (ResponseTopRate) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let empData = try! jsonDecoder.decode(ResponseTopRate.self, from: data)
                    completion(empData)
            }
        }.resume()
    }
}
