require 'csv'
require 'json'
require './supportFunctions'

product_data_import_file = './example.csv'               ## variable of filename CSV to be imported from
product_data_export_file = './exportedData.json'					## variable of filename JSON to be exported to


#######################      Master Function to Determine appropriate sub function       ##########################
def start_data_conversion(data_category, import_file, export_file, input_format, output_format)
    if data_category = 'Product' && input_format = "CSV" && output_format = "JSON"
          puts "reached master sorting function"
          product_CSV_to_JSON(import_file, export_file)
    end 
end


#######################         CSV to JSON function - Product Data       ##########################

def product_CSV_to_JSON(import_file, export_file)

    puts "reached product CSV to JSON function"

    export_data = JSON.pretty_generate(CSV.open(import_file, headers: true).map do |row|


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
          price: price,								           ## variable passed from ternary operator value
    	    cost: cost,								             ## variable passed from ternary operator value
    	    price_type: row['price_type'],			
          quantity_on_hand: quantity_on_hand,		 ## variable passed from ternary operator value
          modifiers: modifiers						       ## object passed in dependent on existence of modifiers
        }

    end)


    # puts export_data


    File.write(export_file, export_data)

end

#######################         Initiate Conversion       ##########################

start_data_conversion('Product', product_data_import_file, product_data_export_file, "CSV", "JSON")





