module AppHelpers
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
