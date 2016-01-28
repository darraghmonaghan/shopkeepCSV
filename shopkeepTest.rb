require 'csv'
require 'json'


export_file = './exportedData.json'


output = JSON.pretty_generate(CSV.open('./example.csv', headers: true).map do |row|
  # modifier = {}
  row.each do |k, v|
  end
  

  ## 1.   Ternary Operators to address blanks / null ##

  modifier_1_name = row['modifier_1_name']
  modifier_1_price = row['modifier_1_price'] != nil ? row['modifier_1_price'].scan(/[-.0-9]/).join().to_f : nil

  modifier_2_name = row['modifier_2_name']
  modifier_2_price = row['modifier_2_price'] != nil ? row['modifier_2_price'].scan(/[-.0-9]/).join().to_f : nil
  
  modifier_3_name = row['modifier_3_name']
  modifier_3_price = row['modifier_3_price'] != nil ? row['modifier_3_price'].scan(/[-.0-9]/).join().to_f : nil

  quantity_on_hand = row['quantity_on_hand'] != nil ? row['quantity_on_hand'].to_i : nil
  price = row['price'] != nil ? row['price'].scan(/[-.0-9]/).join().to_f : nil
  cost = row['cost'] != nil ? row['cost'].scan(/[-.0-9]/).join().to_f : nil


  ## 2.   Ensuring Price_Type is accurate - only nil / 0.0 price items can be "open"  ##

  # if price != nil || 0.0
  # 	price_type = 'system'
  # else
  # 	price_type = 'open'
  # end


  ## 3.   Creating modifiers object, passed into hash later ##

  modifiers =   	

  	if row['modifier_1_name'] && row['modifier_2_name'] && row['modifier_3_name']

				[
				  	{ name: modifier_1_name,
				  	  price: modifier_1_price
				  	},
				  	{
				  	  name: modifier_2_name,
  					  price: modifier_2_price				  		
				  	},
				  	{ 
				  	  name: modifier_3_name,
  					  price: modifier_3_price	
				  	}
			   ]

  	elsif row['modifier_1_name'] && row['modifier_2_name']

				[
				  	{ name: modifier_1_name,
				  	  price: modifier_1_price
				  	},
				  	{
				  	  name: modifier_2_name,
  					  price: modifier_2_price				  		
				  	}
			   ]

    elsif row['modifier_1_name']

				[
				  	{ name: modifier_1_name,
				  	  price: modifier_1_price
				  	}
				]

	else
		[]
	end


  ## 4.   Creating each object entered into JSON  ##

  	{ id: row['item id'].to_i,
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





