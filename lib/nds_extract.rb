$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  i = 0 
  director_names = []
    
    while i < source.length
      director_names << source[i][:name]
      i += 1 
    end
  
  return director_names
end

def total_gross(source)
  dir_names = list_of_directors(source)
  dir_to_earnings_hash = directors_totals(source)
  j = 0 
  
  total = 0
  
  while j < dir_names.length 
       dir_name = dir_names[j]
       total += dir_to_earnings_hash[dir_name]
       j += 1 
  end
  
  return total 
end


