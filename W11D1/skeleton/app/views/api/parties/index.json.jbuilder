json.array! @parties.each do |party|
  json.partial! 'party', party: party
  json.guests do 
    json.array! party.guests.each do |guest|
      json.extract! guest, :name, :age, :favorite_color
    end
  end
end