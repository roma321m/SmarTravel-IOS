import Foundation

struct Trip: Decodable {
    let id, countryId, name, description, image: String?
    let price: Double?
    let tickets: Int?
    let soldOut, popular: Bool?
    
    var formattedPrice: String {
        return String(format: "At %.2f ₪", price ?? 0)
    }
}
