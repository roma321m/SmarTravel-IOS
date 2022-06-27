import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case invalidUrl
    case serverError(String)
    case noData
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let error):
            return error
        case .unknownError:
            return "unknown error :("
        case .noData:
            return "There was no data"
        }
    }
}
