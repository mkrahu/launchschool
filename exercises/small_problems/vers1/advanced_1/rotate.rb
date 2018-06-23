def rotate90(matrix)
  clone = []

  number_of_rows = matrix.size # 3
  number_of_columns = matrix.first.size # 3

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    clone << new_row.reverse
  end
  clone
end

# matrix[0][0] -> matrix[0][2]
# matrix[0][1] -> matrix[1][2]
# matrix[0][2] -> matrix[2][2]
# matrix[1][0] -> matrix[0][1]
# matrix[1][1] -> matrix[1][1]
# matrix[1][2] -> matrix[2][1]
# matrix[2][0] -> matrix[0][0]
# matrix[2][1] -> matrix[1][0]
# matrix[2][2] -> matrix[2][0]

matrix1 = [
  [1, 5, 8],  # [3, 4, 1]
  [4, 7, 2],  # [9, 7, 5]
  [3, 9, 6]   # [6, 2, 8]
]

matrix2 = [
  [3, 7, 4, 2], # [5, 3]
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
