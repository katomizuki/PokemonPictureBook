import Foundation
import UIKit
class TypeUtil {
    
    static func changeType(type:String)->String {
        let utilArray = ["grass","fire","water","bug","normal","poison","electric","ground","fairy","fighting","psychic","ghost","ice","rock","dragon"]
        for i in 0..<PokemonType.allCases.count {
            let pokemonType = PokemonType(rawValue: utilArray[i])
            if type == pokemonType?.rawValue {
                if let text = pokemonType?.description {
                    return text
                }
            }
      }
        return type
    }
}

enum PokemonType:String,CaseIterable {
    case grass = "grass"
    case fire = "fire"
    case water = "water"
    case bug = "bug"
    case normal = "normal"
    case poison = "poison"
    case electric = "electric"
    case ground = "ground"
    case fairy = "fairy"
    case fighting = "fighting"
    case psychic = "psychic"
    case ghost = "ghost"
    case ice = "ice"
    case rock = "rock"
    case dragon = "dragon"
    var description: String{
        switch self {
        case .grass: return "くさタイプ"
        case .fire: return "ほのおタイプ"
        case .water: return "みずタイプ"
        case .bug: return "むしタイプ"
        case .normal: return "ノーマルタイプ"
        case .poison: return "どくタイプ"
        case .ground: return "つちタイプ"
        case .fairy: return "ようせいタイプ"
        case .fighting: return "かくとうタイプ"
        case .psychic: return "エスパータイプ"
        case .ghost: return "ゴーストタイプ"
        case .ice: return "こおりタイプ"
        case .dragon: return "ドラゴンタイプ"
        case .rock: return "いわタイプ"
        case .electric: return "でんきタイプ"
        }
    }
    
}
