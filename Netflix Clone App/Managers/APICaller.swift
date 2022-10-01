//
//  APICaller.swift
//  Netflix Clone App
//
//  Created by Ali Aydoğdu on 1.10.2022.
//

import Foundation

struct Constants{
    static let API_KEY = "bb72289959f49a73a86cefcbb58ba948"
    static let BASE_URL = "https://api.themoviedb.org"
}
enum APIError: Error {
    case failedToGetData
}

class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(comletion:@escaping (Result<[Movie],Error>) -> Void){
        guard let url = URL(string: "\(Constants.BASE_URL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                comletion(.success(results.results))
            } catch {
                comletion(.failure(error))
            }
                 
        }
        task.resume()
    }
}


