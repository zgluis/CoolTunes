import Foundation

struct Song: Decodable {
    var wrapperType: String?
    var collectionId: Int?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var artistViewUrl: String?
    var previewUrl: String?
    var artworkUrl100: String?
    var trackNumber: Int?
}
