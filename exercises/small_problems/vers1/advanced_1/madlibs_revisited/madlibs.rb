# madlibs.rb
# Madlibs Revisited exercise
# Small Problems exercises from LaunchSchool

files = { 'nouns' => 'nouns.txt',
          'verbs' => 'verbs.txt',
          'adverbs' => 'adverbs.txt',
          'adjectives' => 'adjectives.txt' }

words = {}

# load madlibs
files.each do |name, file|    
  File.open("./#{file}", "r") do |f|
    words[name] = []
    f.each_line do |line|
      words[name] << line.chomp
    end
  end
end

madlib_file = ARGV[0]

File.open(madlib_file) do |f|
  f.each_line do |line|
    line_arr = line.split
    new_sentence_arr = line_arr.map do |word|
      case
      when word.include?('<noun>')
        word.gsub('<noun>', words['nouns'].sample)
      when word.include?('<verb>')
        word.gsub('<verb>', words['verbs'].sample)
      when word.include?('<adjective>')
        word.gsub('<adjective>', words['adjectives'].sample)
      when word.include?('<adverb>')
        word.gsub('<adverb>', words['adverbs'].sample)
      else
        word
      end
    end
    puts new_sentence_arr.join(' ')
  end
end

