# frozen_string_literal: false

# handle input from dictionary and output to save
module FileHandler
  def get_entire_contents(file_name)
    dictionary_data = File.open(file_name, 'r')
    dictionary_data.read
  end

  def get_specific_line(file_name, linenum)
    File.open(file_name, 'r').each_with_index do |line, index|
      return line if index + 1 == linenum
    end
    'That line is out of bounds.'
  end
end
