import UIKit
import Alamofire

class ListSongsWorker
{
    func search(term: String, completion: @escaping (ListSongs.Search.Response?, Error?) -> ())
    {
        let fullResource = "search?term=" + parseTerm(term) + "&mediaType=" + Constants.SearchSongs.mediaType + "&limit=" + Constants.SearchSongs.limit
        requestHandler.get(resource: fullResource).validate().responseJSON { response in
            switch response.result {
            case .success(_):
                do {
                    let parsedResponse = try JSONDecoder().decode(ListSongs.Search.Response.self, from: response.data!)
                    completion(parsedResponse,nil)
                } catch let err {
                    completion(nil,err)
                }
            case .failure(let err):
                completion(nil,err)
            }
            
        }
    }
    
    private func parseTerm(_ term: String) -> String {
        
        if term.count <= 1 {
            return term
        }
        
        let strArr: [String] = term.components(separatedBy: " ")
        var parsedStr = ""
        for (wordIndex, word) in strArr.enumerated() {
            if word.count == 0 {
                break;
            }
            
            if wordIndex > 0 {
                parsedStr += "+" + word
            } else {
                parsedStr += word
            }
        }
        return parsedStr
    }
}
