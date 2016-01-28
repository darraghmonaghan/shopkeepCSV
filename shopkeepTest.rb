require 'csv'
require 'json'


export_file = './exportedData.json'					## variable of filename JSON to be exported to


#######################         Supporting Functions        ##########################

		def currency_to_integer(string)
			return string.scan(/[-.0-9]/).join().to_f
		end

		def string_to_integer(string)
			return string.to_i
		end

		def modifier_object(name1, price1, name2, price2, name3, price3)

			  ### Ternary Operators to address blanks / null entries ###
			  modifier_1_price = price1 != nil ? currency_to_integer(price1) : nil

			  modifier_2_price = price2 != nil ? currency_to_integer(price2) : nil
			  
			  modifier_3_price = price3 != nil ? currency_to_integer(price3) : nil

			  	if name1 && name2 && name3
					return [
							  	{ name: name1,
							  	  price: modifier_1_price				
							  	},
							  	{
							  	  name: name2,
			  					  price: modifier_2_price				  		
							  	},
							  	{ 
							  	  name: name3,
			  					  price: modifier_3_price	
							  	}
						   ]

			  	elsif name1 && name2
					return [
							  	{ name: name1,
							  	  price: modifier_1_price
							  	},
							  	{
							  	  name: name2,
			  					  price: modifier_2_price				  		
							  	}
						   ]

			    elsif name1
					return [
							  	{ name: name1,
							  	  price: modifier_1_price
							  	}
							]

				else
					[]
				end
		end



#######################         CSV to JSON function        ##########################

output = JSON.pretty_generate(CSV.open('./example.csv', headers: true).map do |row|
  

  # row.each do |k, v|						### WHAT IS THIS??????
  # end
  											## and what is this end doing? necessary?


  ### Creating variables to pass to JSON object ###
  quantity_on_hand = row['quantity_on_hand'] != nil ? string_to_integer(row['quantity_on_hand']) : nil
  
  price = row['price'] != nil ? currency_to_integer(row['price']) : nil
  
  cost = row['cost'] != nil ? currency_to_integer(row['cost']) : nil

  id = string_to_integer(row['item id'])


  ### Creating modifiers object as a variable ###
  modifiers = modifier_object(row['modifier_1_name'],
  							  row['modifier_1_price'],
  							  row['modifier_2_name'],
  							  row['modifier_2_price'], 
  							  row['modifier_3_name'],
  							  row['modifier_3_price'])	


  ### Creating each object entered into JSON file  ###

  	{ id: id,
	  description: row['description'],
      price: price,								## variable passed from ternary operator value
	  cost: cost,								## variable passed from ternary operator value
	  price_type: row['price_type'],			
      quantity_on_hand: quantity_on_hand,		## variable passed from ternary operator value
      modifiers: modifiers						## object passed in dependent on existence of modifiers
    }



end)














puts output

File.write(export_file, output)





