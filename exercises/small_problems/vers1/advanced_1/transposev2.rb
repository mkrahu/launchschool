def transpose(matrix)
  clone = []
  row_index = 0
  while row_index < matrix.size
    column_index = 0
    while column_index < matrix[row_index].size
      clone[column_index] = [] if clone[column_index].nil?
      clone[column_index] << matrix[row_index][column_index]
      column_index += 1
    end
    row_index += 1
  end
  clone
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose(transpose([[1, 2, 3, 4]])) == [[1, 2, 3, 4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


def transpose2(matrix)
  clone = []
  (0...matrix.size).each do |row_index|
    (0...matrix[row_index].size).each do |column_index|
      clone[column_index] = [] if clone[column_index].nil?
      clone[column_index] << matrix[row_index][column_index]
    end
  end
  clone
end

p transpose2([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]

p transpose2([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose2([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose2([[1]]) == [[1]]