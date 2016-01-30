
#######################         Supporting Functions        ##########################

		def error(number)

			if number == 1
				p "The conversion request you have submitted for those data types is not on offer at present"
			elsif number == 2
				p "Error: Please check the category of conversion you wish to make, valid options are - Customer, Product and Transaction"
			elsif number == 3
				p "Error: Either target import or export file is invalid, please check that file exists and path is correct"
			elsif number == 4
				p "Error: Incorrect data type for imported data - valid types are 'XML', 'CSV' or 'JSON'."
			elsif number == 5
				p "Error: Incorrect data type for exported data - valid types are 'XML', 'CSV' or 'JSON'."
			elsif number == 6	
				p "Error: The system is not currently able to convert data relating to Customers"
			elsif number == 7
				p "Error: The system is not currently able to convert data relating to Transactions"
			end
		end

		def currency_to_integer(string)
			if string[0] == '$' || string[0] == "£" || string[0] == "-"
				return string.scan(/[-.0-9]/).join().to_f
			else
				return nil
			end
		end

		def string_to_integer(string)
			return string.to_i   								## need to remove any letters??
		end

		def description_formatting(string)
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
    category = description_formatting(data_category.to_s).downcase
	import_file_checked = File.file?(import_file.to_s)
	export_file_checked = File.file?(export_file.to_s)
	import_format_checked = description_formatting(input_format.to_s).downcase
	export_format_checked = description_formatting(output_format.to_s).downcase

	if import_file_checked == false || export_file_checked == false
    	return error(3)

	elsif import_format_checked != 'csv' && import_format_checked != 'xml' && import_format_checked != 'json'
    	return error(4)

	elsif export_format_checked != 'csv' && export_format_checked != 'xml' && export_format_checked != 'json'
    	return error(5)
	end


	### Filtering the conversion request based on Conversion Category ###
    if category == 'customer' 
    	return error(6)

    elsif category == 'transaction'
    	return error(7)

    elsif category == 'product'
    	product_category(import_file, export_file, import_format_checked, export_format_checked)
    	return 200 ### for testing purposes
    else
		return error(2)
    end
end


######################      Data Category Function       ##########################

def product_category(import_file, export_file, input_format, output_format)

	if input_format == 'csv' && output_format == 'json'
		product_CSV_to_JSON(import_file, export_file)
		return 200 ## for testing purposes
	else
		return error(1)
	end

end




