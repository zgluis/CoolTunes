import Foundation
import Alamofire

let requestHandler = RequestHandler()

class RequestHandler {
    
    var sessionManager: Alamofire.SessionManager;
    
    init() {
        sessionManager = Alamofire.SessionManager.init()
    }
    
    func get(resource: String) -> DataRequest {
        return sessionManager.request(Constants.baseDomain + resource)
    }
}
