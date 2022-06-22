import Foundation

extension String {
    
    // This converts string to url 
    var asUrl: URL? {
        return URL(string: self)
    }
}
