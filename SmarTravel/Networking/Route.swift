import Foundation

enum Route {
    static let baseUrl = "https://pastebin.com/raw"
    
    case fetchAllCountries
    case fetchAllTrips
    
    var description: String {
        switch self {
        case .fetchAllTrips: return "/E1PvZs5t"
        case .fetchAllCountries: return "/bc6uuYYm"
        }
    }
}
