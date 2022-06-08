
import Foundation

struct Fact: Codable {
    var name: String
    var imageLink: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageLink = "image_link"
    }
}
