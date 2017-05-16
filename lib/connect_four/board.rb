module ConnectFour
  class Board
    attr_accessor :fields

    BLANK = '-'
    COLUMNS = 8
    ROWS = 8

    def initialize
      @fields = Array.new(ROWS) { Array.new(COLUMNS, BLANK)}
    end

    def put_stone symbol, column
      row = ROWS-1
      row -= 1 until @fields[row].nil? || @fields[row][column] == BLANK
      @fields[row].nil? ? return : @fields[row][column] = symbol
      return [row, column]
    end

    def stringified
      "#{(1..COLUMNS).to_a.join(' ')}#{"\n"}#{@fields.map {|row| row.join(' ')}.join("\n")}#{"\n\n"}"
    end

    def quartet? row, column
      horizontal_quartet?(row, column) || vertical_quartet?(row, column) || ascending_quartet?(row, column) || descending_quartet?(row, column)
    end

    def horizontal_quartet? row, column
      count = 1
      (1..3).to_a.each { |i| @fields[row][column + i] == @fields[row][column] ? count +=1 : break }
      (1..3).to_a.each { |i| @fields[row][column - i] == @fields[row][column] ? count +=1 : break }
      count >= 4 && @fields[row][column] != BLANK
    end

    def vertical_quartet? row, column
      array = (0..3).to_a.collect { |i| (row + i) < ROWS ? @fields[row+i][column] : nil}
      array.uniq.size == 1 && array.size >= 4 && array.uniq.first != BLANK
    end

    def ascending_quartet? row, column
      count = 1
      (1..3).to_a.each { |i| @fields[row + i] && @fields[row + i][column - i] == @fields[row][column] ? count +=1 : break }
      (1..3).to_a.each { |i| @fields[row - i] && @fields[row - i][column + i] == @fields[row][column] ? count +=1 : break }
      count >= 4 && @fields[row][column] != BLANK
    end

    def descending_quartet? row, column
      count = 1
      (1..3).to_a.each { |i| @fields[row + i] && @fields[row + i][column + i] == @fields[row][column] ? count +=1 : break }
      (1..3).to_a.each { |i| @fields[row - i] && @fields[row - i][column - i] == @fields[row][column] ? count +=1 : break }
      count >= 4 && @fields[row][column] != BLANK
    end
  end
end
