require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ProtectingHashTest < Minitest::Test

  def setup
    @munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }    
  end

  def protect_hash(hsh)
    new_hsh = Hash.new
    hsh.each do |k, v|
      puts "object id of key #{k} is: #{k.object_id}"
      new_k = String.new(k)
      puts "object id of new key #{new_k} is: #{new_k.object_id}"
      new_hsh[new_k] = Hash[String.new(v.keys.first), v.values.first + 100, String.new(v.keys.last), "other"]
    end
    new_hsh
  end

  def test_0
    new_hsh = protect_hash(@munsters)
    binding.pry
    refute_equal(@munsters, new_hsh)
  end  
end