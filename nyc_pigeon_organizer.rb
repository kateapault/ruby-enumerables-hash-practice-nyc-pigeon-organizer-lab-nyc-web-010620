#get attribute (eg color) - hold :color,
#assign color to each name associated
#for each name, combine colors as list
#make hash {:color => colorslist} for each name
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

colors = {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  }

def map_attributes_to_names_list(attributes)
  by_attribute = attributes.map do |(key,value)|     # HoHoA
    value.map {|val| {val => key} }                 # to AoAoH ex: [[{"Bill"=>:blue},{"Kara"=>:blue}],[{"Kara"=>:green}]] 
  end
  # flatten AoAoH to just AoH eg [{"Bill"=>:blue},{"Kara"=>:blue},{"Kara"=>:green}]
  by_names = by_attribute.reduce([]) {|memo,pair| memo += pair} 
end


  
def combine_attributes_under_names(aoh)
  pigeons = {}
  aoh.map do |pair|
    key = pair.keys[0]
    value = pair[key]
    if !pigeons.include?(key)
      pigeons[key] = [value]
    else
      pigeons[key] += [value]
    end
  end
  pigeons                       #HoA
end

def nyc_pigeon_organizer(pigeon_data)
  pigeon_info
  attributes = pigeon_data.keys
  for attribute in attributes do                    # level :color
    subattributes = pigeon_data[attribute].keys
      for subattribute in subattributes do          # level :blue
        names = pigeon_data[attribute][subattribute]
        for name in names do
          if !pigeon_info.include?(name[attribute])
            pigeon_info[name][attribute] = [subattribute]
        
      end
  end
  
  pigeon_info
end

aoh = map_attributes_to_names_list(colors)
p combine_attributes_under_names(aoh)
    