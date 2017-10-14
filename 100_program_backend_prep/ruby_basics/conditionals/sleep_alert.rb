# sleep_alert.rb
# Sleep Alert exercise
# Ruby Basics exercises from LaunchSchool

status = ['awake', 'tired'].sample

message = if status == 'awake'
            "Be productive!"
          else
            "Go to sleep!"
          end

puts message          