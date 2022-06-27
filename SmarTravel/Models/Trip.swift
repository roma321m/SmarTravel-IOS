import Foundation

struct Trip: Decodable {
    let id, name, description, image: String?
    let price: Double?
    
    var formattedPrice: String {
        return String(format: "At %.2f ₪", price ?? 0)
    }
}

// FIXME: this is a temp data for the tests, need to get from the API
class Trips {
    static var trips: [Trip] = [.init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)The description of the trip will be here so I need to make this text long as fuck :) :)The description of the trip will be here so I need to make this text long as fuck :) :)The description of the trip will be here so I need to make this text long as fuck :) :)The description of the trip will be here so I need to make this text long as fuck :) :)The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90),
                                .init(id: "1", name: "Trip title", description: "The description of the trip will be here so I need to make this text long as fuck :) :)", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png", price: 1499.90)]
}
