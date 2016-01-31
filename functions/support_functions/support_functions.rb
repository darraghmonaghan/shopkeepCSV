
require './functions/support_functions/error_messages.rb'    

#######################         Supporting Functions        ##########################

		def check_formatting(input)
			if input.class == Fixnum || input.class == Float
				return nil
			else
				currency_to_integer(input)
			end
		end

		def file_format(file)
			extension = File.extname(file)
			extension[0] = ''
			return extension
		end

		def string_to_integer(string)
			return string.to_i   								
		end

		def description_formatting(string)
			cleaned = string.to_s.gsub(/\d/, '').strip
			return cleaned.split(" ").map(&:capitalize).join(" ")
		end

		def currency_to_integer(string)
			return string.scan(/[-.0-9]/).join().to_f
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
							  	},{
							  	  name: modifier_2_name,
			  					  price: modifier_2_price				  		
							  	},{ 
							  	  name: modifier_3_name,
			  					  price: modifier_3_price	
							  	}
						   ]

			  	elsif name1 && name2
					return [
							  	{ name: modifier_1_name,
							  	  price: modifier_1_price
							  	},{
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
