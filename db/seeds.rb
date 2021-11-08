require 'uri'
require 'net/http'
require 'CSV'

uri = URI(Rails.configuration.seed_url)
res = Net::HTTP.get_response(uri)

csv = CSV.parse(res.body, :headers => true)
csv.each do |row|
    puts "Inserting pokemon to DB..."
    p = Pokemon.new
    p.pokemonid = row['#']
    
    p.name = row['Name'].encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '*')
    p.type1 = row['Type 1']
    p.type2 = row['Type 2']
    p.total = row['Total']
    p.hp = row['HP']
    p.attack = row['Attack']
    p.defense = row['Defense']
    p.spattack = row['Sp. Atk']
    p.spdefense = row['Sp. Def']
    p.speed = row['Speed']
    p.generation = row['Generation']
    p.legendary = row['Legendary']  
    p.save

    puts "Pokemon created"
end

puts "#{Pokemon.count} pokemon created"