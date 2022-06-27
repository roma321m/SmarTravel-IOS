import Foundation

enum Route {
    static let baseUrl = "https://pastebin.com/raw"
    
    case temp
    
    var description: String {
        switch self {
        case .temp: return "/E1PvZs5t"
        }
    }
}
