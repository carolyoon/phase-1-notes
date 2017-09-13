table_data = [
  ["first_name", "last_name", "city", "state"],
  ["Elisabeth", "Gardenar", "Toledo", "OH"],
  ["Jamaal", "Du", "Sylvania", "OH"],
  ["Kathlyn", "Lavoie", "Maumee", "OH"]
]

def convert_table(table_data)
  converted_table = []
  headers = table_data[0]
  people_info = table_data[1..-1]
  people_counter = 1
  while people_counter < table_data.length
    new_hash = {}
    info_counter = 0
    while info_counter < headers.length
      new_hash[headers[info_counter]] = table_data[people_counter][info_counter]
      info_counter += 1
    end
    converted_table << new_hash
    people_counter += 1
  end
  return converted_table
end

convert_table(table_data)
# => [{"first_name"=>"Elisabeth", "last_name"=>"Gardenar", "city"=>"Toledo", "state"=>"OH"}, {"first_name"=>"Jamaal", "last_name"=>"Du", "city"=>"Sylvania", "state"=>"OH"}, {"first_name"=>"Kathlyn", "last_name"=>"Lavoie", "city"=>"Maumee", "state"=>"OH"}]

