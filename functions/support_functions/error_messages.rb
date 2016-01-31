

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
			elsif number == 8
				p "Mismatch between stated file format and format of target import / export file"
			end
		end