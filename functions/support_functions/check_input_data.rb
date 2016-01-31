
require './functions/support_functions/error_messages.rb'
require './functions/support_functions/product_category.rb' 
require './functions/support_functions/support_functions.rb' 

#######################      Master Function to Determine appropriate Data Category function       ##########################

def check_input_data(data_category, import_file, export_file, input_format, output_format)
    category = description_formatting(data_category.to_s).downcase
	
    import_file_checked = File.file?(import_file.to_s)
	export_file_checked = File.file?(export_file.to_s)

    import_file_format = file_format(import_file.to_s)
    export_file_format = file_format(export_file.to_s)

	import_format_checked = description_formatting(input_format.to_s).downcase
	export_format_checked = description_formatting(output_format.to_s).downcase

	if import_file_checked == false || export_file_checked == false
    	return error(3)

    elsif import_file_format != import_format_checked || export_file_format != export_format_checked
        return error(8)

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
