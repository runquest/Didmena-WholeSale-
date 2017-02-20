class InitialColors < ActiveRecord::Migration
  def change
  	# if Color.find_by(code_value: 'DDEEFF').nil? && Color.find_by(meaning: 'DDEEFF').nil?
  	#    Color.create(code_value: 'DDEEFF', meaning: 'Light blue')
  	# end

# Color names taken from http://www.w3schools.com/colors/colors_names.asp

# 000000 black
  	if Color.find_by(code_value: '000000').nil? && Color.find_by(meaning: 'black').nil?
  	   Color.create(code_value: '000000', meaning: 'black')
 	end
# 000080 navy
  	if Color.find_by(code_value: '000080').nil? && Color.find_by(meaning: 'navy').nil?
  	   Color.create(code_value: '000080', meaning: 'navy')
 	end
# 0000FF blue
  	if Color.find_by(code_value: '0000FF').nil? && Color.find_by(meaning: 'blue').nil?
  	   Color.create(code_value: '0000FF', meaning: 'blue')
 	end
# 008000 green
  	if Color.find_by(code_value: '008000').nil? && Color.find_by(meaning: 'green').nil?
  	   Color.create(code_value: '008000', meaning: 'green')
 	end
# 00FF00 lime
  	if Color.find_by(code_value: '00FF00').nil? && Color.find_by(meaning: 'lime').nil?
  	   Color.create(code_value: '00FF00', meaning: 'lime')
 	end
# 800000 maroon
  	if Color.find_by(code_value: '800000').nil? && Color.find_by(meaning: 'maroon').nil?
  	   Color.create(code_value: '800000', meaning: 'maroon')
 	end
# 808000 olive
  	if Color.find_by(code_value: '808000').nil? && Color.find_by(meaning: 'olive').nil?
  	   Color.create(code_value: '808000', meaning: 'olive')
 	end
# 808080 grey
  	if Color.find_by(code_value: '808080').nil? && Color.find_by(meaning: 'grey').nil?
  	   Color.create(code_value: '808080', meaning: 'grey')
 	end
# FF0000 red
  	if Color.find_by(code_value: 'FF0000').nil? && Color.find_by(meaning: 'red').nil?
  	   Color.create(code_value: 'FF0000', meaning: 'red')
 	end
# FFFF00 yellow
  	if Color.find_by(code_value: 'FFFF00').nil? && Color.find_by(meaning: 'yellow').nil?
  	   Color.create(code_value: 'FFFF00', meaning: 'yellow')
 	end
# FFFFFFF white
  	if Color.find_by(code_value: 'FFFFFF').nil? && Color.find_by(meaning: 'white').nil?
  	   Color.create(code_value: 'FFFFFF', meaning: 'white')
 	end

  end
end