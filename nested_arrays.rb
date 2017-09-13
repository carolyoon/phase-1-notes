def convert_table(table_data)
  # convert nested array into collection of hashes
  converted_arr = []
  keys = table_data[0]
  people = table_data[1..-1]

  i = 0 #for outer loop
  # j = 0 #for inner loop

  while i < people.length
      j = 0
      row_counter = 0
      new_hash = {}
    while j < keys.length
      # make new hash to hold k,v pairs
      # make a counter to keep track of position in row of people

      # add k,v pair of hash[first_name] = ["Elisabeth"]
      new_hash[keys[j]] = people[i][row_counter]
      # increment i, increment row counter

      # add k,v pair of hash[last_name] = ["Gardenar"]
      # increment i, increment row counter
      # add k,v pair of hash[city] = ["Toledo"]
      # increment i, increment row counter
      # add k,v pair of hash[state] = ["OH"]

      j += 1
      row_counter += 1
    end
     converted_arr << new_hash # adds entire array to key
    i += 1
  end
  converted_arr


end
