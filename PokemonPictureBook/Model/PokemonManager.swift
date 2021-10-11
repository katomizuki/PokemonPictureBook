import Foundation
import Alamofire

class PokemonManager {
    
     func fetchPokemon() {
    let pokemonURL = "https://pokeapi.co/api/v2/pokemon-species/1"
        
        AF.request(pokemonURL).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let data = try JSONDecoder().decode(PokemonData.self,from:response.data!)
                    let name = data.name
                    let genera = data.genera[0].genus
                    let explain = data.flavor_text_entries[29].flavor_text
                    let explain2 = data.flavor_text_entries[36].flavor_text
                    let explain3 = data.flavor_text_entries[37].flavor_text
                    print(name)
                    print(genera)
                    print(explain)
                    print(explain2)
                    print(explain3)
                    
                } catch {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    
    }
}
