# README

The Petal Ketchup API is a service that provides CRUD operations for pokemon entity.



# Ruby version
3.0.2

# System dependencies
The next dependencies are required:
 * ruby
 * rails
 * sqlite3
 
# Configuration 
Required configuration value
```ruby
config.seed_url = 'https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv'
```
# Setup

## command for DB Setup
1. DB Migrate
```ruby
rails db:migrate
```
2. DB Seed
```ruby
rails db:seed
```
3. Run Server
```ruby
rails s
```
# Endpoints

### Get All
Retrieve the full list of pokemons

http://localhost:3000/pokemons

### Get by Id
Retrieve specific pokemon 

http://localhost:3000/pokemons/{id}

### Get paginated list of pokemons
Retrieve a paginated list of pokemons

http://localhost:3000/pokemons?pageSize={pageSize}&pageNumber={pageNumber}

### POST / Create Pokemon

http://localhost:3000/pokemons

body
```json
{
        "pokemonid": 1,
        "name": "Bulbasaur",
        "type1": "Grass",
        "type2": "Poison",
        "total": "318",
        "hp": "45",
        "attack": "49",
        "defense": "49",
        "spattack": "65",
        "spdefense": "65",
        "speed": "45",
        "generation": "1",
        "legendary": "False"
    }
```

### PUT / Update Pokemon

http://localhost:3000/pokemons/{id}

body (properties to update)
```json
{
        "name": "Another name for Bulbasaur"
}
```

### Delete / Delete Pokemon

http://localhost:3000/pokemons/{id}