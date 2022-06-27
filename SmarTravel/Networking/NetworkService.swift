import Foundation

struct NetworkService {
    
    static let singleInstance = NetworkService()
    
    private init() {}
    
    func tempRequest(completion: @escaping(Result<Trip, Error>) -> Void) {
        request(route: .temp, method: .get, completion: completion)
    }
    
    /// This function helps to make a new request to the server
    /// - Parameters:
    ///   - route: The path of the resource in the backend
    ///   - method: Type of request to be made
    ///   - parameters: any other information need to be pass to the backend
    ///   - completion: holds the result of the request, can be decoded data or an error
    private func request<T: Decodable>(route: Route,
                                     method: Method,
                                     parameters: [String: Any]? = nil,
                                     completion: @escaping(Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, parameters: parameters) else {
            completion(.failure(AppError.unknownError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
                let responseString = String(data: data, encoding: .utf8) ?? "Could not stringify our data"
                print("The response is:\n\(responseString)")
            } else if let error = error {
                result = .failure(error)
                print("The error is:\n\(error)")
            }
            DispatchQueue.main.async {
                self.handleResponse(result: result, completion: completion)
            }
            
        }.resume()
    }
    
    
    /// This function handles the reponse from the server and decodes the data
    /// - Parameters:
    ///   - result: holds the result from the requst to the server, can be data or error
    ///   - completion: holds the output of the function, can be decoded data or error
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                completion: (Result<T, Error>) -> Void) {
        guard let result = result else {
            completion(.failure(AppError.unknownError))
            return
        }
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try?
                    decoder.decode(ApiResponse<T>.self, from: data) else {
                completion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error {
                completion(.failure(AppError.serverError(error)))
            } else if let decodedData = response.data {
                completion(.success(decodedData))
            } else {
                completion(.failure(AppError.noData))
            }
            
        case .failure(let error):
            completion(.failure(error))
        }
    }
    
    /// This function helps us to generate a urlRequest
    /// - Parameters:
    ///   - route: The path of the resource in the backend
    ///   - method: Type of request to be made
    ///   - parameters: any other information need to be pass to the backend
    /// - Returns: URLRequest
    private func createRequest(route: Route,
                               method: Method,
                               parameters: [String: Any]? = nil) -> URLRequest? {
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asUrl else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
            case .post, .delete, .patch:
                let bodyData = try?
                JSONSerialization.data(withJSONObject: params, options: [])
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
