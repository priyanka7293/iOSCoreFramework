
import Foundation

public enum SpeedyMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class SpeedyRequest {
    
    public var request: URLRequest!
    
    public var baseUrl: URL?
    public var fullUrl: URL!

    public var httpMethod: SpeedyMethod!
    public var httpParams: SpeedyParams?
    public init(baseUrl : URL,fullUrl : URL, httpMethod : SpeedyMethod, httpParams : SpeedyParams){
        self.baseUrl = baseUrl
        self.fullUrl = fullUrl
        self.httpMethod = httpMethod
        self.httpParams = httpParams
    }
    
    public init?(route: String? = nil, url: URL? = nil, method: SpeedyMethod = .get, params: SpeedyParams? = nil) {
        SpeedyNetworking.setCustomAuthHeader()
        //SpeedyNetworking.setServerUrl(url: URL(string: GlobalConstants.BaseURL))
        httpMethod = method
        httpParams = params
        if let requestBase = SpeedyConfiguration.shared.defaultUrl, let requestRoute = route {
            baseUrl = requestBase
            fullUrl = requestBase.appendingPathComponent(requestRoute)
        } else if let requestUrl = url {
            fullUrl = requestUrl
        } else {
            return nil
        }
        
        configureRequest()
    }
    
    public func configureRequest() {
        request = URLRequest(url: fullUrl)
        request.httpMethod = httpMethod.rawValue
        
        if let params = httpParams {
            request.httpBody = params.paramData
        }
        
       // if let _ = baseUrl {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue(SpeedyConfiguration.shared.defaultAuthorizationHeader, forHTTPHeaderField: "Authorization")
        //}
    }
    
    public func execute(completion: @escaping (SpeedyResponse) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            let response = SpeedyResponse(data: data, response: response, error: error)
            
            DispatchQueue.main.async {
                completion(response)
            }
            
            self.logDebug(data: data)
        }.resume()
    }
    
    public func logDebug(data: Data?) {
        guard let debugData = data else { return }
        
        let responseString = String(data: debugData, encoding: String.Encoding.utf8) ?? ""
        //print(responseString)
    }
    
}
