//
//  ApiManager.swift
//  RestAPI
//
//  Created by mac on 29.07.2022.
//

import Foundation

//описываем структуру наших запросов
enum ApiType {
    case login
    case getUsers
    case getPosts
    case getAlbums
    
    //описываем сам запрос
    var baseUrl: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    //описываем хедер
    var headers: [String : String] {
        switch self {
        case .login:
            return ["authToken" : "12345"]
        default:
            return [:]
        }
    }
    
    //описываем путь для каждого запроса
    var path: String {
        switch self {
        case .login:
            return "login"
        case .getUsers:
            return "users"
        case .getPosts:
            return "posts"
        case .getAlbums:
            return "albums"
        }
    }
    
    //делаем сам request
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl)!)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
         
        switch self {
        case .login:
            request.httpMethod = "POST"
            return request
        default:
            request.httpMethod = "GET"
            return request
        }
    }
}

//класс который релизовывает эти запросы
class ApiManger {
    static let shared = ApiManger()
    
    //функция на получение данных по каждому из запросу
    func getUser(comletion: @escaping (Albun) -> Void) {
        let request = ApiType.getUsers.request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let users = try? JSONDecoder().decode(Albun.self, from: data) {
                comletion(users)
            } else {
                print("")
            }
        }
        task.resume()
    }
}
