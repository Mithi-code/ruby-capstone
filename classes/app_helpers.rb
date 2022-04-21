module AppHelpers
  def preserve_list(list, file_name)
    json = JSON.generate list
    File.write("#{file_name}.json", json)
  end

  def load_list(list, file_name, type)
    return unless File.exist?("#{file_name}.json")

    json_list = JSON.parse File.read("#{file_name}.json")
    json_list.each do |json|
      list << type.from_json(json)
    end
  end

  def get_date(statement)
    print statement
    puts '(yyyy-mm-dd) :'
    date_string = gets.chomp.downcase
    DateTime.parse(date_string)
  end

  def yes_or_no(statement)
    puts "#{statement} (y,n)"
    answer = gets.chomp.downcase
    (answer == 'y')
  end
end
