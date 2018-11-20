def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

# 'true' and 'false' are Strings and will always be 'truthy', therefore the if statement on line 4 always will be true

