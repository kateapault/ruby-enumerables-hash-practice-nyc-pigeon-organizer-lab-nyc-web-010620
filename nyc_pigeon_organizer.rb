#get attribute (eg color) - hold :color,
#assign color to each name associated
#for each name, combine colors as list
#make hash {:color => colorslist} for each name

def map_attributes_to_names_list(attributes)
  by_attribute = attributes.map do |(key,value)|     # HoHoA
    value.map {|val| {val => key} }                 # to AoAoH ex: [[{"Bill"=>:blue},{"Kara"=>:blue}],[{"Kara"=>:green}]] 
  end
  # flatten AoAoH to just AoH eg [{"Bill"=>:blue},{"Kara"=>:blue},{"Kara"=>:green}]
  by_names = by_attribute.reduce([]) {|memo,pair| memo += pair} 
end

def get_names(data)
  names = []
  data[:color].map do |color|
    names.push(color[1])
  end
  names = names.join(',').split(',').uniq
  names
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

def nyc_pigeon_organizer(data)
  pigeon_info = {}
  names = get_names(data)
  names.each {|name| pigeon_info[name] = {} }
  
  attributes = data.keys
  
  
  attributes.each do |attribute|                  # level :color
    subattributes = data[attribute].keys
      subattributes.each do |subattribute|         # level :blue
        names = data[attribute][subattribute]
        names.each do |name|
          if !pigeon_info[name].include?(attribute)
            pigeon_info[name][attribute] = [subattribute.to_s]
          else 
            pigeon_info[name][attribute] += [subattribute.to_s]
          end
        end
      end 
  end
  
  pigeon_info
end

