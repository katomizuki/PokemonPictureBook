import Foundation
class UserDefaultsRepository {
    // UserDefaults に使うキー
    static let userDefaultsPokemonKey = "pokemon_favorites"

    static func saveToUserDefaults(pokemon: [PokemonModel]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(pokemon)
            UserDefaults.standard.set(data, forKey: userDefaultsPokemonKey)
        } catch {
            print(error)
        }
    }

    static func loadFromUserDefaults() -> [PokemonModel] {
        let decoder = JSONDecoder()
        do {
            guard let data = UserDefaults.standard.data(forKey: userDefaultsPokemonKey) else {
                return []
            }
            let tasks = try decoder.decode([PokemonModel].self, from: data)
            return tasks
        } catch {
            print(error)
            return []
        }
    }
    
    static func deleteFromUserDefaults(index:Int,pokemons:[PokemonModel])->[PokemonModel] {
       var pokemonArray = pokemons
       pokemonArray.remove(at: index)
       let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(pokemonArray)
            UserDefaults.standard.set(data, forKey: userDefaultsPokemonKey)
        } catch {
            print(error)
        }
        return pokemonArray
    }
}
