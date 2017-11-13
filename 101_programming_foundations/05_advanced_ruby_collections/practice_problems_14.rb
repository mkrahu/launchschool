# practice_problems_14.rb
# Practice Problems exercises
# Practice Problems from Sorting, Nested Collections and Working
# with Blocks chapter from LaunchSchool


hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = hsh.map do |_, value|
        if value[:type] == 'fruit'
          value[:colors].map do |element|
            element.capitalize
          end
        elsif value[:type] == 'vegetable'
          value[:size].upcase
        end 
      end

p arr
