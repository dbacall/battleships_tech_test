class Board

  def initialize
    @layout = Array.new(9, Array.new(9, 'x'))
  end

  def show
    puts "  1 2 3 4 5 6 7 8 9"
    @layout.each.with_index(1) { |row, index|
      puts "#{index} #{row.join(' ')}"
    }
  end

end
