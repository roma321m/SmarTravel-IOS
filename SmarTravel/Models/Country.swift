import Foundation

struct Country {
    let id: String
    let name: String
    let image: String
}

// FIXME: this is a temp data for the tests, need to get from the API
class Countries {
    static var countries :[Country] = [.init(id: "id1",
                                             name: "Brazil",
                                             image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/brazil.imageset/brazil.png"),
                                       .init(id: "id2",
                                             name: "Canada",
                                             image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/canada.imageset/canada.png"),
                                       .init(id: "id3", name: "Germany", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/germany.imageset/germany.png"),
                                       .init(id: "id4", name: "Israel", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/israel.imageset/israel.png"),
                                       .init(id: "id5", name: "Russia", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/russia.imageset/russia.png"),
                                       .init(id: "id6", name: "Switzerland", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/switzerland.imageset/switzerland.png"),
                                       .init(id: "id7", name: "USA", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/united-states-of-america.imageset/united-states-of-america.png"),
                                       .init(id: "id8", name: "Turkey", image: "https://raw.githubusercontent.com/roma321m/SmarTravel-iOS/main/SmarTravel/Assets.xcassets/flags/turkey.imageset/turkey.png")]
}
