//
//  RocketAPI.swift
//  StoreItem
//
//  Created by Admin on 18/04/2021.
//

import Foundation
struct Rocket {
    var id : String
    var name : String
    
    var firstFlight : String
    var flickrImages : [String]
    var country :String
    var weight : Double
    var height : Double
    
        func getFirstFlight() -> String? {
            guard let date = firstFlight.toDate() else {
                return nil
                
            }
            return date.toString()
        }
    
}

extension Rocket : Decodable {
    enum CodingKeys : String , CodingKey{
        case id
        case name
        case firstFlight = "first_flight"
        case flickrImages = "flickr_images"
        case country
        case height
        case weight = "mass"
        
        enum RocketHeight : String , CodingKey{
            case meters
        }
        enum RocketWeight : String , CodingKey{
            case kg
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy:  CodingKeys.self)
        id = try container.decode(String.self,forKey:  .id)
        name = try container.decode(String.self,forKey:  .name)
        firstFlight = try container.decode(String.self,forKey:  .firstFlight)
        flickrImages = try container.decode([String].self,forKey:  .flickrImages)
        country = try container.decode(String.self,forKey:  .country)
        
        let heightContainer = try! container.nestedContainer(keyedBy: CodingKeys.RocketHeight.self, forKey: .height)
        height = try heightContainer.decode(Double.self, forKey: .meters)
        let weightContainer = try! container.nestedContainer(keyedBy: CodingKeys.RocketWeight.self, forKey: .weight)
        weight = try weightContainer.decode(Double.self, forKey: .kg)
        
    }
}

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
