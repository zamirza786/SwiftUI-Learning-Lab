//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Zahur-Afzal Mirza on 30/03/26.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()

    private let cache = NSCache<NSString, UIImage>()

    static let baseURL =
        "https://raw.githubusercontent.com/zamirza786/iOS-Appetizers/refs/heads/main"

    private let appetizerURL = baseURL + "/appetizers.json"

    private init() {}

    //    func getAppetizer(
    //        completed: @escaping (Result<[Appetizer], APError>) -> Void
    //    ) {
    //        guard let url = URL(string: appetizerURL) else {
    //            completed(.failure(.invalidURL))
    //            return
    //        }
    //
    //        let urlRequest = URLRequest(url: url)
    //
    //        let task = URLSession.shared.dataTask(with: urlRequest) {
    //            data,
    //            response,
    //            error in
    //            if error != nil {
    //                completed(.failure(.unableToComplete))
    //                return
    //            }
    //
    //            guard let response = response as? HTTPURLResponse,
    //                response.statusCode == 200
    //            else {
    //                completed(.failure(.invalidResponse))
    //                return
    //            }
    //
    //            guard let data = data else {
    //                completed(.failure(.invalidData))
    //                return
    //            }
    //
    //            do {
    //                let decoder = JSONDecoder()
    //                let decodedResponse = try decoder.decode(
    //                    AppetizerResponse.self,
    //                    from: data
    //                )
    //                completed(.success(decodedResponse.request))
    //            } catch {
    //                completed(.failure(.invalidData))
    //            }
    //        }
    //
    //        task.resume()
    //    }

    func getAppetizer() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }


        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch { 
            throw APError.invalidData
        }
    }

    func downloadImage(
        fromURLString urlString: String,
        completed: @escaping (UIImage?) -> Void
    ) {

        let cacheKey = NSString(string: urlString)

        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }

        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) {
            data,
            response,
            error in

            guard let data = data,
                let image = UIImage(data: data)
            else {
                completed(nil)
                return
            }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)

        }

        task.resume()
    }
}
