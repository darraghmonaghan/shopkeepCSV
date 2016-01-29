
#######################      Master Function to Determine appropriate Data Category function       ##########################

def check_data_category(data_category, import_file, export_file, input_format, output_format)
    category = data_category.downcase

    if category != 'customer' || category != 'transaction' || category != 'product'
    	puts "Error: Incorrect category of conversion data entered, please check entry. Valid options - 'Product', 'Customer' or 'Transaction'."
		return -100			## negative 100 return used for testing purposes

    elsif category == 'customer' 
    	puts "Error: The system is not currently able to convert data relating to Customers"
    	return -100			## negative 100 return used for testing purposes

    elsif category == 'transaction'
    	puts "Error: The system is not currently able to convert data relating to Transactions"
    	return -100			## negative 100 return used for testing purposes

    elsif category == 'product'
    	product_category(import_file, export_file, input_format, output_format)
    	return 200 		## positive 200 return used for testing purposes
    end
end


#######################      Data Category Function       ##########################

def product_category(import_file, export_file, input_format, output_format)
	import_file_check = File.file?(import_file)
	export_file_check = File.file?(export_file)
	import_format = input_format.downcase
	export_format = output_format.downcase

	if import_format != 'csv' || import_format != 'xml' || import_format != 'json'
    	puts "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
		return -100			## negative 100 return used for testing purposes

	elsif export_format != 'csv' || export_format != 'xml' || export_format != 'json'
    	puts "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
		return -100			## negative 100 return used for testing purposes

	elsif import_file_check == false || export_file_check == false
		puts "Error: Problem identified with target import and export files, please check their naming, as well as path file accuracy"
     	return -100
	end

	if import_format == 'csv' && export_format == 'json'
		product_CSV_to_JSON(import_file, export_file)
		return 200
	else
		puts "The conversion request you have submitted is not on offer at present"
		return -100
	end

end






#######################         Supporting Functions        ##########################

		def currency_to_integer(string)
			return string.scan(/[-.0-9]/).join().to_f			## tried almost everything to get to 2 decimal points
		end

		def string_to_integer(string)
			return string.to_i   								## need to remove any letters??
		end

		def description_formatting(string)
			cleaned = string.gsub(/\d/, '').strip
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