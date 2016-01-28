require 'csv'
require 'json'


puts JSON.pretty_generate(CSV.open('./example.csv', headers: true).map do |row|
  modifier = {}
  row.each do |k, v|
  end
  
  modifiers =   	

  	if row['modifier_1_name'] && row['modifier_2_name'] && row['modifier_3_name']

				[
				  	{ name: row['modifier_1_name'],
				  	  price: row['modifier_1_price'].scan(/[.0-9]/).join().to_f
				  	},
				  	{
				  	  name: row['modifier_2_name'],
  					  price: row['modifier_2_price'].scan(/[.0-9]/).join().to_f				  		
				  	},
				  	{ 
				  	  name: row['modifier_3_name'],
				  	  price: row['modifier_3_price'].scan(/[.0-9]/).join().to_f
				  	}
			   ]

  	elsif row['modifier_1_name'] && row['modifier_2_name']

				[
				  	{ name: row['modifier_1_name'],
				  	  price: row['modifier_1_price'].scan(/[.0-9]/).join().to_f
				  	},
				  	{
				  	  name: row['modifier_2_name'],
  					  price: row['modifier_2_price'].scan(/[.0-9]/).join().to_f				  		
				  	}
			   ]

    elsif row['modifier_1_name']

				[
				  	name: row['modifier_1_name'],
				  	price: row['modifier_1_price'].scan(/[.0-9]/).join().to_f
				]

	else
		[]
	end


  	{ id: row['item id'].to_i,
	  description: row['description'],
      price: row['price'],
	  cost: row['cost'],
	  price_type: row['price_type'],
      quantity_on_hand: row['quantity_on_hand'].to_i,
      modifiers: modifiers
    }



end)


# .scan(/[.0-9]/).join().to_f


