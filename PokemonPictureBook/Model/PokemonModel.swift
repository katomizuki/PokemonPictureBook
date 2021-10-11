
import Foundation
import Alamofire

struct PokemonModel:Codable {
    var name:String
    var id:Int
    var genus:String
    var explain:String
    var explain2:String
    var explain3:String
    var height:Int
    var weight:Int
    var urlImage:String
    init(dic:[String:Any]) {
        self.name = dic["name"] as? String ?? "フシギダネ"
        self.genus = dic["genus"] as? String ?? "たねポケモン"
        self.explain = dic["explain"] as? String ?? "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        self.explain2 = dic["explain2"] as? String ?? "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        self.explain3 = dic["explain3"] as? String ?? "生まれたときから　背中に 不思議な　タネが　植えてあって 体と　ともに　育つという。"
        self.id = dic["id"] as? Int ?? 1
        self.height = dic["height"] as? Int ?? 0
        self.weight = dic["weight"] as? Int ?? 0
        self.urlImage = dic["urlImage"] as? String ?? "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png"
    }
}

struct PokemonData:Codable {
    var name:String
    var id:Int
    var names:[Names]
    var genera:[Genera]
    var flavor_text_entries:[Explain]
    var varieties:[Varieties]
}
struct Names:Codable {
    var name:String
}
struct Genera:Codable {
    var genus:String
}
struct Explain :Codable{
    var flavor_text:String
}
struct Varieties:Codable {
    var pokemon:Pokemon
}
struct Pokemon :Codable {
    var url:String
}
struct PokemonData2:Codable {
    var height:Int
    var weight:Int
    var sprites:Front
}
struct Front:Codable {
    var front_default:String
}

