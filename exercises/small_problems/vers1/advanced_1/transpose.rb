def transpose(matrix)
  clone = []
  matrix.each_with_index do |column, column_index|
    new_row = column.map.with_index { |_, row_index| matrix[row_index][column_index] }
    clone << new_row
  end

  clone
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further exploration

def transpose!(matrix)
  column_index = 0
  while column_index < matrix.size
    row_index = column_index
    while row_index < matrix[column_index].size
      matrix[column_index][row_index], matrix[row_index][column_index] = matrix[row_index][column_index], matrix[column_index][row_index]
      row_index += 1
    end
    column_index += 1
  end

  matrix
end

new_matrix = transpose!(matrix)
p matrix
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]