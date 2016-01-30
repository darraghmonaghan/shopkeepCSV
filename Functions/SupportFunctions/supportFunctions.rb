
#######################         Supporting Functions        ##########################

def product_CSV_to_JSON(import_file, export_file)

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

    File.write(export_file, export_data)				 ## Exports the desired data to the target file specified previously in importerExporter.rb

end





		def currency_to_integer(string)
			return string.scan(/[-.0-9]/).join().to_f			## tried almost everything to get to 2 decimal points
		end

		def string_to_integer(string)
			return string.to_i   								## need to remove any letters??
		end

		def description_formatting(string)
			# puts 'description_formatting function reached'
			cleaned = string.to_s.gsub(/\d/, '').strip
			return cleaned.split(" ").map(&:capitalize).join(" ")
		end


		def modifier_object(name1, price1, name2, price2, name3, price3)

			  ### Ternary Operators to address blanks / null entries ###
			  modifier_1_name = name1 != nil ? description_formatting(name1) : nil
			  modifier_1_price = price1 != nil ? currency_to_integer(price1) : nil

			  modifier_2_name = name2 != nil ? description_formatting(name2) : nil
			  modifier_2_price = price2 != nil ? currency_to_integer(price2) : nil

			  modifier_3_name = name3 != nil ? description_formatting(name3) : nil		  
			  modifier_3_price = price3 != nil ? currency_to_integer(price3) : nil

			  	if name1 && name2 && name3
					return [
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

			  	elsif name1 && name2
					return [
							  	{ name: modifier_1_name,
							  	  price: modifier_1_price
							  	},
							  	{
							  	  name: modifier_2_name,
			  					  price: modifier_2_price				  		
							  	}
						   ]

			    elsif name1
					return [
							  	{ name: modifier_1_name,
							  	  price: modifier_1_price
							  	}
							]

				else
					[]
				end
		end



#######################      Master Function to Determine appropriate Data Category function       ##########################

def check_input_data(data_category, import_file, export_file, input_format, output_format)
    category = description_formatting(data_category).downcase
	import_file_checked = File.file?(import_file.to_s)
	export_file_checked = File.file?(export_file.to_s)
	import_format_checked = description_formatting(input_format).downcase
	export_format_checked = description_formatting(output_format).downcase

	### Ensuring input data is complete, correct, and within set parameters ###
  #   if category != 'customer' || category != 'transaction' || category != 'product'
  #   	puts "Error: What is going on!."
		# return -100			## negative 100 return used for testing purposes

	# elsif import_file_checked == false || export_file_checked == false
	# 	puts "Error: Problem identified with target import and export files, please check their naming, as well as path file accuracy"
 #     	return -100

	if import_file == true || export_file == true
    	puts "Error: Boolean value trying to be input as either import or export target file"
		return -100			## negative 100 return used for testing purposes

	elsif import_format_checked != 'csv' && import_format_checked != 'xml' && import_format_checked != 'json'
    	puts "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
		return -100			## negative 100 return used for testing purposes

	elsif export_format_checked != 'csv' && export_format_checked != 'xml' && export_format_checked != 'json'
    	puts "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
		return -100			## negative 100 return used for testing purposes
	end


	### Filtering the conversion request based on Conversion Category ###
    if category == 'customer' 
    	puts "Error: The system is not currently able to convert data relating to Customers"
    	return -100			## negative 100 return used for testing purposes

    elsif category == 'transaction'
    	puts "Error: The system is not currently able to convert data relating to Transactions"
    	return -100			## negative 100 return used for testing purposes

    elsif category == 'product'
    	product_category(import_file, export_file, import_format_checked, export_format_checked)
    	return 200 		## positive 200 return used for testing purposes
    end
end


#######################      Data Category Function       ##########################

def product_category(import_file, export_file, input_format, output_format)

	if input_format == 'csv' && output_format == 'json'
		product_CSV_to_JSON(import_file, export_file)
		return 200
	else
		puts "The conversion request you have submitted for those data types is not on offer at present"
		return -100
	end

end




