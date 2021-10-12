import Foundation
//Mark PokemonModels
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
    var type:String
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
struct PokemonDetail:Codable {
    var height:Int
    var weight:Int
    var sprites:Front
    var types:[Types]
}
struct Front:Codable {
    var front_default:String
}
struct Types:Codable {
    var type:Name
}
struct Name:Codable {
    var name:String
}
