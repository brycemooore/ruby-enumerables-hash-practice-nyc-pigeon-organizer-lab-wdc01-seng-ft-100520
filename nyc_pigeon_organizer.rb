

def assign_attributes(data, attribute, specific, birds)
  birds.each{|name|
    data[name][attribute] << specific
  }
end

def return_array_of_birds(data, symbol, specific)
  data.each{|keyword, inner_data|
  if keyword == symbol 
    inner_data.each{|type, birds|
      if type == specific
        return birds 
      end 
    }
  end 
  }
end

def nyc_pigeon_organizer(data)
  alternate_data = {}
  names = []
  data.each {|attributes, specifics|
    specifics.each{|specific_attributes, names_of_birds|
      names_of_birds.each{|birds|
        names << birds 
      }
    }
  }
  
  counter = 0 
  names = names.uniq 
  
  names.size.times{
    alternate_data[names[counter]] = {
      :color => [],
      :gender => [],
      :lives => []
    }
    counter += 1 
  }
  
  data.each{|key, inner_data|
    inner_data.each{|inner_key, birds|
      assign_attributes(alternate_data, key, inner_key.to_s, return_array_of_birds(data, key, inner_key))
    }
  }
 
  p alternate_data
end

