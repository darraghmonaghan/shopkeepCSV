require 'csv'
require 'json'
require './supportFunctions'


export_file = './exportedData.json'					## variable of filename JSON to be exported to


#######################         CSV to JSON function        ##########################

output = JSON.pretty_generate(CSV.open('./example.csv', headers: true).map do |row|


  ### Creating variables to pass to JSON object ###
  quantity_on_hand = row['quantity_on_hand'] != nil ? string_to_integer(row['quantity_on_hand']) : nil
  
  price = row['price'] != nil ? currency_to_integer(row['price']) : nil
  
  cost = row['cost'] != nil ? currency_to_integer(row['cost']) : nil

  id = string_to_integer(row['item id'])

  description = description_formatting(row['description'])


  ### Creating modifiers object as a variable ###
  modifiers = modifier_object(row['modifier_1_name'],
  							  row['modifier_1_price'],
  							  row['modifier_2_name'],
  							  row['modifier_2_price'], 
  							  row['modifier_3_name'],
  							  row['modifier_3_price'])	


  ### Creating each object entered into JSON file  ###

  	{ id: id,
	  description: description,
      price: price,								## variable passed from ternary operator value
	  cost: cost,								## variable passed from ternary operator value
	  price_type: row['price_type'],			
      quantity_on_hand: quantity_on_hand,		## variable passed from ternary operator value
      modifiers: modifiers						## object passed in dependent on existence of modifiers
    }



end)


# puts output


File.write(export_file, output)





